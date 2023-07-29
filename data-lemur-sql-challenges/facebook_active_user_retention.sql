select 
  date_part('month', event_date) as month,
  count(distinct user_id) as monthly_active_users
from 
  user_actions
where
  user_id in (select distinct user_id from user_actions where date_part('month', event_date) = 6) AND
  date_part('month', event_date) = 7 AND
  event_type in ('sign-in','like','comment')
group by 
  date_part('month', event_date);