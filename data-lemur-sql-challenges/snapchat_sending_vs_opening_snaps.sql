-- sending vs opening snaps --

with age_group as( 
  select 
    a.activity_type,
    a.time_spent,
    ab.age_bucket
  from 
    activities as a  
    left join age_breakdown as ab  
    on a.user_id = ab.user_id
  where 
    a.activity_type in ('send','open')
),

open_send_sums as (
  select 
    age_bucket,
    sum(case when activity_type = 'open' then time_spent else 0 end) as open_sum,
    sum(case when activity_type = 'send' then time_spent else 0 end) as send_sum,
    sum(time_spent) as total_sum
  from 
    age_group
  group by 
    age_bucket
)

select
  age_bucket,
  round((send_sum / total_sum) * 100 , 2) as send_perc,
  round((open_sum / total_sum) * 100 , 2) as open_perc
from open_send_sums;