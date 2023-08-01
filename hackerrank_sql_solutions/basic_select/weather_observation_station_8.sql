select distinct
    city
from
    station
where
    left(city,1) in ('a','i','u','e','o') and
    right(city,1) in ('a','i','u','e','o');