select
    concat(name, '(', substring(occupation,1,1),')') as Name
from
    occupations
order by 
    name;

select
    concat('There are a total of ', count(occupation), ' ', lower(occupation), 's.') as totals
from
    occupations
group by occupation
order by totals;