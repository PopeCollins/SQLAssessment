SELECT * FROM plans_plan;
SELECT * FROM savings_savingsaccount;
SELECT * FROM users_customuser;
SELECT * FROM withdrawals_withdrawal;


-- QUERY 1
-- Create a subquery that returns only plan_id for trasaction in the last 1 year from savings_savingsaccount Table 
Select plan_id
from savings_savingsaccount
where  transaction_date > (curdate() - interval 365 day);

-- QUERY 2
-- Join QUERY 1 with savings_savingsaccount table using Where not in

Select plan_id,
transaction_date, 
datediff( curdate(), last_returns_date) as inactivity_days 
from savings_savingsaccount
where id 
		not in (Select plan_id 
		from savings_savingsaccount
		where  transaction_date > (curdate() - interval 365 day));

-- QUERY 3
-- Join the above query with the plans_plan Table to return the complete task

select p.id as Plan_id,
		p.owner_id,
		p.description as Type,
		T.transaction_date As Last_transaction_date, 
		T.inactivity_days
from plans_plan p
join 	(Select plan_id,
				transaction_date, 
				datediff( curdate(), last_returns_date) as inactivity_days 
		from savings_savingsaccount
		where id not in (Select plan_id 
		from savings_savingsaccount
		where  transaction_date > (curdate() - interval 365 day))) T
on T.plan_id = p.id;


