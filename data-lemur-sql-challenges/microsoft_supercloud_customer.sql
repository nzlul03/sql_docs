with cte as ( 
  select 
    customer_id,
    count(distinct p.product_category) as total_categories
  from customer_contracts as c 
  left join products p  
  on c.product_id = p.product_id 
  group by customer_id
)

select customer_id 
from cte 
where total_categories = 3;