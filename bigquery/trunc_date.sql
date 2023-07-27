with 
  raw_data as(
  select
    start_time
  from `bigquery-public-data.austin_bikeshare.bikeshare_trips`
  limit 1000
  )

select
  start_time,
  -- trunc month
  DATE_TRUNC(start_time, MONTH) as month,
  -- extract year
  EXTRACT(YEAR from start_time) as year
from raw_data
