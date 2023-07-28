select 
  app_id,
  round(
    100.0*
    sum(case when event_type = 'click' then 1 else 0 end) / 
    sum(case when event_type = 'impression' then 1 else 0 end), 2) as ctr
from events
where timestamp >= '2022-01-01' and timestamp < '2023-01-01'
group by app_id;