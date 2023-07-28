with cte as ( 
  select count(distinct policy_holder_id) as m
  from callers
  group by policy_holder_id
  having count(case_id) > 2
)

select 
  sum(m) as member_count
from 
  cte;