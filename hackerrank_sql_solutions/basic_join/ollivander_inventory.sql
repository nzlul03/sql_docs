select
    w.id,
    wp.age,
    w.coins_needed,
    w.power
from wands w
left join wands_property wp
on w.code = wp.code
where 
    wp.is_evil = 0
    and w.coins_needed = (select min(w1.coins_needed)
                         from wands w1
                          join wands_property wp1
                          on w1.code = wp1.code
                          where
                            wp.age = wp1.age and
                            w.power = w1.power)
order by
    w.power desc,
    wp.age desc