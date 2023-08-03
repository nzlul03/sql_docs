select 
    s.proj_start_date,
    min(e.proj_end_date) as real_proj_end_date
from
    (select 
        start_date as proj_start_date
    from
        projects
    where
        start_date not in (select end_date from projects)) s,
    (select 
        end_date as proj_end_date
    from
        projects
    where
        end_date not in (select start_date from projects)) e

where 
    s.proj_start_date < e.proj_end_date
group by 
    s.proj_start_date
order by
    datediff(min(e.proj_end_date), s.proj_start_date) asc,
    s.Proj_Start_Date ASC;
