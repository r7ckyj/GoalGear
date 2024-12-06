# GoalGear
 ## Project Summary
In this project, I analyzed the order log and stock control data for a fictional soccer equipment retailer, GoalGear Pro. Using SQL, I extracted insights on sales trends, inventory levels, and customer purchasing patterns. The goal of this analysis is to explore GoalGear Pro’s order log and stock control data to uncover trends in sales, inventory levels, and customer behavior. I utilized Tableau to create visualizations that displayed metrics such as revenue breakdowns and product performance. These insights could help streamline operations, optimize inventory management, and improve marketing strategies. The project showcases my ability to work with real-world business data, utilize SQL for analysis, and build intuitive visualizations to inform decision-making.

## About the Data
The datasets used in this project contain synthetic data generated specifically for analysis. Since I created the data myself (using the help of ChatGPT, Google Random Number Generator, and BehindTheName.com), it was already clean and no preprocessing steps were taken.

- Order Log Data: Contains information on customer orders, including order IDs, quantities, and purchase dates
-	Stock Control Data: Contains inventory records, including item IDs, current stock levels, restocking schedules, and unit prices
-	Imported csv’s into MySQL Workbench to be queried

## Analyzing Data with MySQl
The MySQL queries I used to analyze the data (and generate the following visualizations) can be found [HERE](https://github.com/r7ckyj/GoalGear/blob/c3343146076e143f8f6f8d2c2cb51be2768583ac/GoalGearQs.sql)

## Visualizations With Tableau
<p align="center">
  <img width="460" src="GoalGear pngs/Bestsellers.png">
</p>
Soccer Balls were our top-selling item of the week, leading sales on three out of six days (tied w/ Lanyards on Tuesday)

<p align="center">
  <img width="231" src="GoalGear pngs/Revenue_Weekday.png">
</p>
We brought in the most revenue on Saturday, and the least on Wednesday

<p align="center">
<img width="482" src="GoalGear pngs/Understocked.png">
</p>
The most concerning finding was that several orders included understocked items, preventing them from being processed until restocking is completed. Addressing this should be a priority.

## Insights/Areas for Improvement
### Product Insights
Certain products consistently perform well, indicating steady demand. These should be prioritized for better stock management.

### Revenue Optimizations
There are opportunities to boost revenue by focusing on high-margin products or bundling products that sell well together. 

### Inventory Gaps
Some products were running low in stock, leading to missed sales opportunities. We should improve forecasting and/or make restocking more responsive. I recommend implementing automated alerts for low-stock items and a recommendation system for restocking based on sales forecasts

### Marketing
Categorizing customers based on their purchasing behavior and targeting them with personalized marketing can prove beneficial.



 




