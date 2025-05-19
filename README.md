## Assessment Answer
# Q1
Task: Write a query to find customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.
 
### QUERY 1
-- Query to return the count of savings and the amount saved called the table Saving
### QUERY 2
Querry to return the count of investment called the table Plan
### QUERY 3
Query to join the tables 


# Q2
Task: Calculate the average number of transactions per customer per month and categorize them:
•	"High Frequency" (≥10 transactions/month)
•	"Medium Frequency" (3-9 transactions/month)
•	"Low Frequency" (≤2 transactions/month)
### QUERY 1
 Creat a table with subquery that returns customer count from savings_savingsaccount Table called it C_Count
### QUERY 2
Create a table with subquery the number of month each customer transact since last joined called it tenure
### QUERY 3 
Join the 2 above table with with users_customuser Table called is T_table
### QUERY 4 
Join T_Table with users_customuser Table and Make CASE for the Categories.
# Q3
Task: Find all active accounts (savings or investments) with no transactions in the last 1 year (365 days)
### QUERY 1
Create a subquery that returns only plan_id for trasaction in the last 1 year from savings_savingsaccount Table 
### QUERY 2
Join QUERY 1 with savings_savingsaccount table using Where not in
### QUERY 3
Join the above query with the plans_plan Table to return the complete task
# Q4
Task: For each customer, assuming the profit_per_transaction is 0.1% of the transaction value, calculate:
•	Account tenure (months since signup)
•	Total transactions
•	Estimated CLV (Assume: CLV = (total_transactions / tenure) * 12 * avg_profit_per_transaction)
•	Order by estimated CLV from highest to lowest
### QUERY 1
 Query to join the savings_savingsaccount and users_customuser tables




