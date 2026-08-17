-- AGGREAGATE FUNC
SELECT COUNT(*)
FROM job_postings_fact;

--WINDOW
SELECT 
    job_id,
    COUNT(*) OVER()
FROM
    job_postings_fact;




SELECT 
    job_id,
    job_title_short,
    company_id,
    salary_hour_avg,
    AVG(salary_hour_avg) OVER (
        PARTITION BY job_title_short, company_id
    ) 
FROM job_postings_fact
WHERE salary_hour_avg IS NOT NULL
ORDER BY RANDOM()
LIMIT 10;





SELECT 
    job_id,
    job_title_short,
    salary_hour_avg,
    RANK() OVER (
        ORDER BY salary_hour_avg DESC    
    ) AS rank_hourly_salary
FROM 
    job_postings_fact
WHERE 
    salary_hour_avg IS NOT NULL
-- ORDER BY    
--     salary_hour_avg DESC
LIMIT 15;


---LAG ()

SELECT  
    job_id,
    company_id,
    job_title,
    job_title_short,
    job_posted_date,
    salary_year_avg,
    LEAD(salary_year_avg) OVER(
        PARTITION BY company_id
        ORDER BY job_posted_date
    ) AS next_posting_salary,
    salary_year_avg - LEAD(salary_year_avg) OVER(
        PARTITION BY company_id
        ORDER BY job_posted_date
    ) AS salary_change
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
ORDER BY company_id, job_posted_date
LIMIT 60;
