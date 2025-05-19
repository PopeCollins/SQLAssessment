SELECT * FROM plans_plan;
SELECT * FROM savings_savingsaccount;
SELECT * FROM users_customuser;
SELECT * FROM withdrawals_withdrawal;

-- QUERY 1
-- Query to join the savings_savingsaccount and users_customuser table

select u.id As customer_id, 
	concat(u.first_name,' ',u.last_name) As name,
	timestampdiff(month, u.date_joined, curdate()) As tenure_months,
	count(*)  As total_transactions,
	(count(*)/timestampdiff(month, u.date_joined, curdate()))*12*(count(*)/12) As estimated_clv
from users_customuser u
join savings_savingsaccount s on s.owner_id = u.id
group by u.id
order by estimated_clv desc;









