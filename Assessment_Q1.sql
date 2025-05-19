SELECT * FROM plans_plan;
SELECT * FROM savings_savingsaccount;
SELECT * FROM users_customuser;
SELECT * FROM withdrawals_withdrawal;

-- QUERY 1
-- Query to return the count of savings and the amount saved called the table Saving
select owner_id, count(owner_id) As Savings_Count, 
Sum(confirmed_amount) As Total_Deposit
from savings_savingsaccount
group by owner_id;

-- QUERY 2
-- Querry to return the count of investment called the table Plan
select owner_id, count(owner_id) As Investment_Count
from plans_plan
group by owner_id;

-- QUERY 3
-- Query to join the tables 
select id as owner_id, 
	concat(first_name,' ',last_name) As name, 
	Savings_Count, Investment_Count, 
	Total_Deposit 
from users_customuser u
join (select owner_id, count(owner_id) As Savings_Count, 
	Sum(confirmed_amount) As Total_Deposit
	from savings_savingsaccount
	group by owner_id) Saving 
on Saving.owner_id = u.id
join(select owner_id, count(owner_id) As Investment_Count
	from plans_plan
	group by owner_id) Plan 
on Plan.owner_id= u.id;


