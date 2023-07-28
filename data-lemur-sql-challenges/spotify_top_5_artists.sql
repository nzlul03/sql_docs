with artist_top10 as ( 
  select 
    a.artist_name,
    count(a.artist_name) as appearance 
  from 
    global_song_rank as gsr 
    left join songs as s 
    on gsr.song_id = s.song_id
    left join artists as a  
    on s.artist_id = a.artist_id 
  where 
    gsr.rank <= 10
  group by a.artist_name
),

artist_ranking as ( 
  select 
    artist_name,
    appearance,
    dense_rank() over(order by appearance desc) as artist_rank
  from 
    artist_top10 
)

select 
  artist_name,
  artist_rank
from 
  artist_ranking 
where 
  artist_rank <= 5;