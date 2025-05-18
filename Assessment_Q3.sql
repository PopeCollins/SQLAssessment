SELECT * FROM plans_plan;
SELECT * FROM savings_savingsaccount;
SELECT * FROM users_customuser;
SELECT * FROM withdrawals_withdrawal;

-- QUERY 1
-- Subquery that returns the transaction days and inactive days
select distinct owner_id, 
	transaction_type_id, 
    transaction_date as last_transaction_date, 
	datediff( curdate(), last_returns_date) as inactivity_days
from savings_savingsaccount
where transaction_date < now() - interval 365 day;

-- QUERY 2
-- The join query that return the complete 
select p.id as plan_id, 
p. owner_id, 
p.description as type, 
no_trans.last_transaction_date, 
no_trans.inactivity_days 
from plans_plan p
join (select distinct owner_id, 
	transaction_type_id, 
	transaction_date as last_transaction_date, 
	datediff( curdate(), last_returns_date) as inactivity_days
from savings_savingsaccount
where transaction_date < now() - interval 365 day) no_trans 
on no_trans.owner_id = p.owner_id;

