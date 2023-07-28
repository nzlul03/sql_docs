select 
  user_id,
  extract(day from max(post_date) - min(post_date)) as days_between
from posts
where post_date between '2021-01-01' and '2021-12-31'
group by user_id
having extract(day from max(post_date) - min(post_date)) not in ('0');