with latest_transactions as ( 
  select 
    transaction_date,
    user_id,
    product_id,
    dense_rank() over (partition by user_id order by transaction_date desc) as latest_purchase
  from 
  user_transactions
)

select 
  transaction_date,
  user_id,
  sum(latest_purchase) as purchase_count 
from 
  latest_transactions 
where 
  latest_purchase = 1 
group by transaction_date, user_id 
order by transaction_date;