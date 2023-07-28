with odd_even_measurements as (
  select 
    measurement_id,
    measurement_value,
    measurement_time,
    date(measurement_time) as measurement_day,
    dense_rank() over(partition by date(measurement_time) order by measurement_time asc) as measurement_number
  from 
    measurements
)

select 
  measurement_day,
  sum(case when measurement_number in (1, 3, 5) then measurement_value else 0 end) as odd_sum,
  sum(case when measurement_number in (2, 4, 6) then measurement_value else 0 end) as even_sum
from 
  odd_even_measurements 
group by 
  measurement_day;