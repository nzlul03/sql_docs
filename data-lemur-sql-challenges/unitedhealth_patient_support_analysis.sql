with cte as (
  select *,
  lead(call_received) over(partition by policy_holder_id order by call_received) as next_call
  from 
    callers
)

select 
  count(distinct policy_holder_id) as patient_count
from cte 
where extract(epoch from next_call-call_received) < 24*60*60*7;
