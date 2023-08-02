select
    h.hacker_id,
    h.name,
    sum(max_score.t1) as total_score
from
    hackers h 
inner join
(
    select max(s.score) as t1,
        s.hacker_id
    from submissions s
    group by 
        s.challenge_id,
        s.hacker_id
    having t1 > 0) as max_score
    on 
        h.hacker_id = max_score.hacker_id
    group by h.hacker_id, h.name
    order by total_score desc, hacker_id asc;