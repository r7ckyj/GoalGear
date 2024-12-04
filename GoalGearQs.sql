
-- Create order_total column, update with values
ALTER TABLE OrderLog
ADD Order_Total DECIMAL(10,2);

WITH OrderTotals AS (
    SELECT Order_ID, SUM(Total_Price) AS Total
    FROM OrderLog
    GROUP BY Order_ID
)
UPDATE OrderLog
JOIN OrderTotals
ON orderlog.Order_ID = OrderTotals.Order_ID
SET orderlog.Order_Total = OrderTotals.Total;

SELECT * FROM OrderLog;

-- Find customers with multiple distinct items purchased
SELECT Customer_Name
FROM OrderLog
GROUP BY Customer_Name
HAVING COUNT(Item_ID)>1;

-- Sort weekdays by number of orders placed
SELECT DAYNAME(Order_Date) AS Weekday, COUNT(DISTINCT Order_ID) NumOrders
FROM OrderLog
GROUP BY Order_Date
ORDER BY COUNT(DISTINCT Order_ID) DESC;

-- Sort weekdays by total items sold
SELECT DAYNAME(Order_Date) AS Weekday, SUM(Quantity) TotUnitsSold
FROM OrderLog
GROUP BY Order_Date
ORDER BY SUM(Quantity) DESC;

-- Sort weekdays by total revenue generated
SELECT DAYNAME(Order_Date) AS Weekday, SUM(Total_Price) AS Revenue
FROM OrderLog
GROUP BY Order_Date
ORDER BY Revenue DESC;

-- Calculate the average units sold per order for each weekday
SELECT 
    DAYNAME(Order_Date) AS Weekday,
    CAST(SUM(Quantity) AS DECIMAL(4, 2)) / COUNT(DISTINCT Order_ID) AS UnitsPerOrder
FROM 
    OrderLog
GROUP BY 
    DAYNAME(Order_Date)
ORDER BY 
    UnitsPerOrder DESC;

-- Find bestselling item and total units sold
SELECT Item_Name, SUM(Quantity) AS Units_Sold
FROM OrderLog
JOIN StockControl
ON StockControl.Item_ID = OrderLog.Item_ID
GROUP BY Item_Name
ORDER BY Units_Sold DESC
LIMIT 1;

-- Find items needing restocking and associated orders
SELECT *
FROM (
    SELECT 
        Item_Name, 
        Order_ID, 
        Quantity_In_Stock - SUM(Quantity) OVER (PARTITION BY OrderLog.Item_ID ORDER BY Order_ID) AS Stock_after_processed
    FROM 
        OrderLog
    JOIN 
        StockControl
        ON StockControl.Item_ID = OrderLog.Item_ID
) AS StockProcessing
WHERE Stock_after_processed < 0
ORDER BY Order_ID;



-- Find the bestselling item for each weekday and the total units sold
WITH Temp AS (
    SELECT DAYNAME(Order_Date) AS Weekday, Item_Name, SUM(Quantity) AS Units_Sold
    FROM OrderLog
    JOIN StockControl
    ON StockControl.Item_ID = OrderLog.Item_ID
    GROUP BY Weekday, Item_Name
)
SELECT Weekday, Item_Name, Units_Sold
FROM Temp t1
WHERE Units_Sold = (
    SELECT MAX(t2.Units_Sold)
    FROM Temp t2
    WHERE t1.Weekday = t2.Weekday
)
ORDER BY Weekday;
