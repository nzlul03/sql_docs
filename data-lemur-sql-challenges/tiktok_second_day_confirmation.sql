select distinct
  user_id
from emails as e 
inner join texts as t  
on e.email_id = t.email_id
where 
  t.signup_action = 'Confirmed' and 
  date_part('day', t.action_date - e.signup_date) = 1;