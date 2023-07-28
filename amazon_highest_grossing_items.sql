with top_sales as ( 
  select 
    category,
    product,
    sum(spend) as total_spend
  from 
    product_spend 
  where 
    date_part('year', transaction_date) = 2022
  group by 
    category,
    product
),

top_sales_rank as (
  select 
    category,
    product,
    total_spend,
    dense_rank() over(partition by category order by total_spend desc) as product_rank 
  from 
    top_sales 
)

select 
  category,
  product,
  total_spend 
from 
  top_sales_rank
where 
  product_rank <= 2;