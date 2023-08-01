select distinct
    city
from 
    station
where
    left(city,1) not in ('a','i','u','e','o');