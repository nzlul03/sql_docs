with tweet_count as(
  select 
    count(tweet_id) as tweet_count,
    user_id
  from tweets
  where
    tweet_date between '2022-01-01' and '2022-12-31'
  group by user_id
) 

select 
  tweet_count as tweet_bucket,
  count(user_id) as user_num
from tweet_count
group by tweet_count;