with cte as (
  select
    *,
    lag(transaction_timestamp) over (partition by merchant_id, credit_card_id, amount order by transaction_timestamp) as prev_transaction_time 
  from 
    transactions
)

select 
  count(transaction_id) as payment_count
from 
  cte 
where 
  extract(epoch from transaction_timestamp - prev_transaction_time)/60 <= 10;