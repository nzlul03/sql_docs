select
    s.name
from students s 
inner join friends f
on s.ID = f.ID
inner join packages p
on f.ID = p.ID
inner join packages fp
on f.friend_id = fp.ID
where fp.salary > p.salary
order by fp.salary;
