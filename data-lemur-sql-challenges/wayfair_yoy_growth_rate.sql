with user_spending as( 
  select 
    date_part('year', transaction_date) as year,
    product_id,
    spend as curr_year_spend,
    lag(spend) over(partition by product_id order by transaction_date asc) as prev_year_spend 
  from 
    user_transactions
)

select 
  year,
  product_id,
  curr_year_spend,
  prev_year_spend,
  case 
    when prev_year_spend is null then null 
    else 
    round(
        ((curr_year_spend / prev_year_spend)-1)*100,2) 
    end as yoy_rate
  from 
    user_spending;