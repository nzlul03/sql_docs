with duplicate as (
  select 
    company_id,
    title,
    description,
    count(job_id) as job_postings
  from 
    job_listings
  group by 
    company_id,
    title,
    description
  having count(job_id)>1
)

select 
count (distinct company_id) as duplicate_companies
from duplicate;