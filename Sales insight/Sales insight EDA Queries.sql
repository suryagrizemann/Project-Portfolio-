use sales;
show tables;
describe customers;
select*from transactions where currency='USD';
select product_code,customer_code from transactions;

#Transactions for Chennai market (market code for chennai is Mark001)
SELECT * FROM transactions where market_code='Mark001';

#Distinct product codes that were sold in chennai
SELECT distinct product_code FROM transactions where market_code='Mark001';

#Transactions in 2020 join by date table
SELECT transactions.*, date.* FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020;

#Total revenue in year 2020,
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020 and transactions.currency="INR\r" or transactions.currency="USD\r";

#Total revenue in year 2020, January Month
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020 and date.month_name="January" and (transactions.currency="INR\r" or transactions.currency="USD\r");

#Total revenue in year 2020 in Chennai
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020
and transactions.market_code="Mark001";