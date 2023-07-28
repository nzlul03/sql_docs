with transactions_rank as (
  select 
    user_id,
    spend,
    transaction_date,
    DENSE_RANK() OVER (PARTITION BY user_id ORDER BY transaction_date ASC) as ranking
  from 
    transactions
)

select 
  user_id,
  spend,
  transaction_date
from 
  transactions_rank
where 
  ranking = 3;