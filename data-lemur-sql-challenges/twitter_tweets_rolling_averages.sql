select 
  user_id,
  tweet_date,
  round(avg(tweet_count) over (partition by user_id order by tweet_date rows between 2 preceding and current row), 2) as rolling_avg_3_days
from 
    tweets
group by 
    user_id,
    tweet_date,
    tweet_count;