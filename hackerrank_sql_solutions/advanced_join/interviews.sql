select
    a.contest_id,
    a.hacker_id,
    a.name,
    sum(total_submissions) as total_submissions,
    sum(total_accepted_submissions) as total_accepted_submissions,
    sum(total_views) as total_views,
    sum(total_unique_views) as total_unique_views
from contests a
left join colleges b
    on a.contest_id = b.contest_id
left join challenges c
    on b.college_id = c.college_id

left join(select challenge_id,
            sum(total_views) as total_views,
            sum(total_unique_views) as total_unique_views
         from view_stats
         group by challenge_id) d
    on c.challenge_id = d.challenge_id

left join(select challenge_id,
            sum(total_submissions) as total_submissions,
            sum(total_accepted_submissions) as total_accepted_submissions
         from submission_stats
         group by challenge_id) e
    on c.challenge_id = e.challenge_id

group by a.contest_id, a.hacker_id, a.name
having(total_submissions + total_accepted_submissions + total_views + total_unique_views) > 0
order by a.contest_id;
