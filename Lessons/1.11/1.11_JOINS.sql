SELECT 
    jpf.job_country,
    jpf.job_title_short,
    cd.name AS company_name,
    jpf.job_location  
FROM 
    job_postings_fact AS jpf 
LEFT JOIN company_dim AS cd
    ON jpf.company_id = cd.company_id
LIMIT 10;

SELECT 
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills
FROM job_postings_fact AS jpf
LEFT JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
LEFT JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id

SELECT 
    cd.name AS company_name,
    COUNT(jpf.job_id) AS posting_count,
FROM job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
    ON jpf.company_id = cd.company_id
GROUP BY cd.name
