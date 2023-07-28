with signup_info as( 
  select 
    e.email_id,
    e.user_id,
    t.signup_action
  from 
    emails as e  
  left join texts as t  
  on e.email_id = t.email_id
)

select 
  round(
    (select count(distinct email_id) from signup_info where signup_action = 'Confirmed')::NUMERIC/count(distinct email_id)::NUMERIC, 2
  ) as confirm_rate 
from 
  signup_info;