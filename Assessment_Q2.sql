SELECT * FROM plans_plan;
SELECT * FROM savings_savingsaccount;
SELECT * FROM users_customuser;
SELECT * FROM withdrawals_withdrawal;

-- QUERY 1
-- Creat a table with subquery that returns customer count from savings_savingsaccount Table called it C_Count
select  owner_id, 
count(*) as customer_count
from savings_savingsaccount
group by owner_id;

-- QUERY 2
-- Create a table with subquery the number of month each customer transact since last joined called it tenure
Select id,
timestampdiff(month, date_joined, curdate()) As tenure_months
from users_customuser
group by id;

-- QUERY 3 
-- Join the 2 above table with with users_customuser Table called is T_table
Select u.id,
	concat(first_name,' ',last_name) As Full_name,
	C_count.customer_count,
	((C_count.customer_count)/tenure.tenure_months) As avg_transactions_per_month
From users_customuser u
				join(select  owner_id, 
							count(*) as customer_count
							from savings_savingsaccount
							group by owner_id) C_count
				on C_count.owner_id = u.id

				Join(Select id,
							timestampdiff(month, date_joined, curdate()) As tenure_months
							from users_customuser
							group by id) tenure
on tenure.id = u.id;

-- QUERY 4 
-- Join T_Table with users_customuser Table and Make CASE for the Categories.

select concat(first_name,' ',last_name) As Full_name,
	CASE WHEN avg_transactions_per_month >= 10 then 'High Frequency'
		 WHEN avg_transactions_per_month between 2 and 9 then 'Medium Frequncy'
         WHEN avg_transactions_per_month <= 2 then 'Low Frequency'
	END AS frequency_category,
	T_able.customer_count,
	T_able.avg_transactions_per_month
from users_customuser
join(Select u.id,
			concat(first_name,' ',last_name) As Full_name,
			C_count.customer_count,
			((C_count.customer_count)/tenure.tenure_months) As avg_transactions_per_month
			From users_customuser u
				join(select  owner_id, 
							count(*) as customer_count
							from savings_savingsaccount
							group by owner_id) C_count
				on C_count.owner_id = u.id

				Join(Select id,
							timestampdiff(month, date_joined, curdate()) As tenure_months
							from users_customuser
							group by id) tenure
				on tenure.id = u.id) T_able
on T_able.id = users_customuser.id;



	