select 
  u.city,
  count(order_id) as total_orders
from trades as t
left join users as u
on t.user_id = u.user_id
where t.status = 'Completed'
group by u.city
order by total_orders desc
limit 3;