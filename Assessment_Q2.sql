SELECT * FROM plans_plan;
SELECT * FROM savings_savingsaccount;
SELECT * FROM users_customuser;
SELECT * FROM withdrawals_withdrawal;

-- QUERY 1
-- Creating a subquery to fetch the avg transaction per month
select  owner_id, 
count(*) as customer_count, 
count(*)/12 as avg_transactions_per_month
from savings_savingsaccount
group by owner_id;

-- QUERY 2
-- The query for the complete table
select concat(first_name,' ',last_name) As Full_name, 
CASE WHEN avg_transactions_per_month >= 10 then 'High Frequency'
		 WHEN avg_transactions_per_month between 2 and 9 then 'Medium Frequncy'
         WHEN avg_transactions_per_month <= 2 then 'Low Frequency'
	END AS frequency_category,
customer_count,
avg_transactions_per_month
from users_customuser u
join (select  owner_id, count(*) as customer_count, count(*)/12 as avg_transactions_per_month
from savings_savingsaccount
group by owner_id) trans  on trans.owner_id= u.id;






	