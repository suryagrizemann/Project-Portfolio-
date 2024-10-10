# Sales Insights for a Computer Hardware Manufacturer

This project focused on uncovering critical sales insights to support a computer hardware manufacturer's decision-making process. The sales team struggled to access actionable data, so the goal was to provide a clear, data-driven view of their sales performance.

## Technologies Used
- SQL
- Power BI
This project highlights the use of SQL for data exploration, Power Query for data transformation, and Power BI for visualization, resulting in a powerful tool for data-driven decision-making.

## Key Components

### 1. Data Analysis Using SQL
Conducted exploratory data analysis (EDA) to extract valuable insights from the sales data. Key SQL queries included:
- Extracting customer records and transactions for specific markets.
- Analyzing sales trends by currency and year.
- Calculating total revenue by year, month, and market.
```sql
-- Show all customer records
SELECT * FROM customers;

-- Show total number of customers
SELECT count(*) FROM customers;

-- Show transactions for Chennai market (market code for chennai is Mark001)
SELECT * FROM transactions where market_code='Mark001';

-- Show distinct product codes that were sold in Chennai
SELECT distinct product_code FROM transactions where market_code='Mark001';

-- Show transactions where currency is US dollars
SELECT * from transactions where currency="USD";

-- Show transactions in 2020 (join with the date table)
SELECT transactions.*, date.* 
FROM transactions 
INNER JOIN date 
ON transactions.order_date = date.date 
WHERE date.year = 2020;

-- Show total revenue in 2020
SELECT SUM(transactions.sales_amount) 
FROM transactions 
INNER JOIN date 
ON transactions.order_date = date.date 
WHERE date.year = 2020 AND (transactions.currency = "INR" OR transactions.currency = "USD");

-- Show total revenue in January 2020
SELECT SUM(transactions.sales_amount) 
FROM transactions 
INNER JOIN date 
ON transactions.order_date = date.date 
WHERE date.year = 2020 AND date.month_name = "January" AND (transactions.currency = "INR" OR transactions.currency = "USD");

-- Show total revenue in Chennai in 2020
SELECT SUM(transactions.sales_amount) 
FROM transactions 
INNER JOIN date 
ON transactions.order_date = date.date 
WHERE date.year = 2020 AND transactions.market_code = "Mark001"; 
```
### 2. Data Transformation with Power Query
Transformed and normalized the data to ensure consistency, enabling accurate analysis. A custom formula was applied to convert all sales amounts to a single currency.

-- Formula to create normalised_amount column

= Table.AddColumn(#"Filtered Rows", "normalised_amount", each if [currency] = "USD" or [currency] = "USD#(cr)" then [sales_amount] * 75 else [sales_amount])


### 3. Dashboard Creation with Power BI
Established relationships between tables in Power BI to enable seamless analysis across multiple data sources.
Developed an interactive dashboard that visualizes sales performance across different dimensions, empowering the sales team to make informed decisions.

#### Key Insights
![key insights](https://github.com/user-attachments/assets/a2c09872-ea87-491b-a8d4-8d8ebea677bc)

#### Performance Insights
![performance insights](https://github.com/user-attachments/assets/49dc8f03-cd22-4ab5-afe7-8d4db9eb1ae1)

#### Profit Analysis
![Profit Analysis](https://github.com/user-attachments/assets/d9f24c71-1901-4077-a669-2f988ac4b469)

### Conclusion:

This project successfully addressed the challenge of unlocking hidden sales insights for a computer hardware manufacturer. By leveraging SQL for in-depth data analysis, Power Query for data transformation, and Power BI for data modeling and visualization, the sales team gained access to a comprehensive dashboard that enables informed, data-driven decisions. The integration of these tools not only streamlined the analysis process but also provided valuable insights that were previously inaccessible, ultimately contributing to better strategic planning and improved business outcomes.
