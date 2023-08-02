select
    sum(c.population)
from city as c
left join country as co
on c.countrycode = co.code
where
    continent= 'Asia';