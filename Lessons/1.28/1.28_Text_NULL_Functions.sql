SELECT LENGTH('SQL');

SELECT LOWER('SQL');

SELECT UPPER('sql');

SELECT LEFT('SQL', 2);

SELECT RIGHT('SQL', 2);

SELECT SUBSTRING('SQL', 2, 1);

SELECT CONCAT('SQL', '-', 'Functions');

SELECT 'SQL' || '-' || 'Functions';

SELECT TRIM(' SQL ');

SELECT REPLACE('SQL', 'Q', 'B');

SELECT REGEX_REPLACE('data.nerd@gmail.com', 'ˆ.*(@)', '\1');








WITH title_lower AS (
    SELECT 
        job_title,
        LOWER(TRIM(job_title)) AS job_title_clean
    FROM job_postings_fact
)

SELECT  
    job_title_clean,
    CASE 
        WHEN job_title_clean LIKE '%ata%' 
            AND job_title_clean LIKE '%analyst%' THEN 'data analyst' 
        WHEN job_title_clean LIKE '%data%' 
            AND job_title_clean LIKE '%engineer%' THEN 'data engineer' 
        WHEN job_title_clean LIKE '%data%' 
            AND job_title_clean LIKE '%scientist%' THEN 'data scientist'
        ELSE  'Other'
    END AS job_title_category,
FROM title_lower
ORDER BY RANDOM()
LIMIT 30;





SELECT
    salary_year_avg,
    salary_hour_avg,
    NULLIF(salary_year_avg, 0),
    NULLIF(salary_hour_avg, 0)
FROM 
    job_postings_fact
WHERE salary_hour_avg IS NOT NULL OR salary_year_avg IS NOT NULL
LIMIT 10;




SELECT
    salary_year_avg,
    salary_hour_avg,
    COALESCE(salary_year_avg, salary_hour_avg * 2000) 
FROM 
    job_postings_fact
WHERE salary_hour_avg IS NOT NULL OR salary_year_avg IS NOT NULL
LIMIT 10;






SELECT COALESCE(NULL, NULL, 2);
SELECT NULLIF(10, 20);