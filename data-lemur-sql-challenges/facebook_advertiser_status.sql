with cte_1 as ( 
  select 
    a.user_id,
    a.status,
    d.paid 
  from 
    advertiser as a  
  left join daily_pay d  
  using (user_id) 
  
union all  

  select 
    d.user_id,
    a.status,
    d.paid 
  from 
    advertiser as a  
  right join daily_pay d  
  using (user_id)
  where a.user_id is null)

select 
  user_id,
  case when status is null and paid is not null
    then 'NEW'
  when status = 'NEW' and paid is not null
    then 'EXISTING'
  when status = 'NEW' and paid is null 
    then 'CHURN'
  when status = 'EXISTING' and paid is not null 
    then 'EXISTING'
  when status = 'EXISTING' and paid is null
    then 'CHURN'
  when status = 'CHURN' and paid is not null 
    then 'RESURRECT'
  when status = 'CHURN' and paid is null 
    then 'CHURN'
  when status = 'RESURRECT' and paid is not null 
    then 'EXISTING'
  when status = 'RESURRECT' and paid is null 
    then 'CHURN'

end as new_status
from cte_1 
order by user_id;