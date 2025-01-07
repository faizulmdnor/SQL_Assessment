--q1
select 
	distinct s.s_id,
	AVG (s_score) as avg_score

from Student s
left join Score r
on s.s_id = r.s_id
left join Course c
on c.c_id = r.c_id

group by s.s_id

having AVG(r.s_score) >60

--q2
select s.s_id, s_name
from Student s
left join Score r
on s.s_id = r.s_id
left join Course c
on c.c_id = r.c_id
left join Teacher t
on c.t_id = t.t_id

where t_name = 'Chang San'

--q3
SELECT DISTINCT 
    s1.s_id AS student_id,
    s1.s_name AS student_name
FROM 
    Student s1
JOIN 
    Score r1
    ON s1.s_id = r1.s_id
JOIN 
    Course c1
    ON r1.c_id = c1.c_id
JOIN 
    Score r2
    ON c1.c_id = r2.c_id
JOIN 
    Student s2
    ON r2.s_id = s2.s_id
WHERE 
    s2.s_id = '01'
    AND s1.s_id != '01';

--q4
SELECT 
    c.c_id AS course_id,
    c.c_name AS course_name,
    CASE 
        WHEN r.s_score BETWEEN 85 AND 100 THEN '[100-85]'
        WHEN r.s_score BETWEEN 70 AND 84 THEN '[85-70]'
        WHEN r.s_score BETWEEN 60 AND 69 THEN '[70-60]'
        ELSE '[<60]'
    END AS score_segment,
    COUNT(r.s_id) AS student_count
FROM 
    Course c
LEFT JOIN 
    Score r
    ON c.c_id = r.c_id
GROUP BY 
    c.c_id, 
    c.c_name,
    CASE 
        WHEN r.s_score BETWEEN 85 AND 100 THEN '[100-85]'
        WHEN r.s_score BETWEEN 70 AND 84 THEN '[85-70]'
        WHEN r.s_score BETWEEN 60 AND 69 THEN '[70-60]'
        ELSE '[<60]'
    END
ORDER BY 
    c.c_id, 
    score_segment;

--q5
SELECT 
    s.s_id AS student_id,
    s.s_name AS student_name,
    AVG(r.s_score) AS average_score,
    RANK() OVER (ORDER BY AVG(r.s_score) DESC) AS ranking
FROM 
    Student s
LEFT JOIN 
    Score r
    ON s.s_id = r.s_id
GROUP BY 
    s.s_id, s.s_name
ORDER BY 
    ranking;

--q6
SELECT 
    course_id,
    course_name,
    student_id,
    student_name,
    score,
    ranking
FROM (
    SELECT 
        c.c_id AS course_id,
        c.c_name AS course_name,
        s.s_id AS student_id,
        s.s_name AS student_name,
        r.s_score AS score,
        ROW_NUMBER() OVER (PARTITION BY c.c_id ORDER BY r.s_score DESC) AS ranking
    FROM 
        Course c
    JOIN 
        Score r
        ON c.c_id = r.c_id
    JOIN 
        Student s
        ON r.s_id = s.s_id
) RankedScores
WHERE 
    ranking <= 3
ORDER BY 
    course_id, ranking;


--q7
WITH RankedScores AS (
    SELECT 
        s.s_name AS student_name,
        r.s_score AS score,
        c.c_name AS course_name,
        t.t_name AS teacher_name,
        RANK() OVER (PARTITION BY c.c_id ORDER BY r.s_score DESC) AS ranking
    FROM 
        Score r
    JOIN 
        Student s
        ON r.s_id = s.s_id
    JOIN 
        Course c
        ON r.c_id = c.c_id
    JOIN 
        Teacher t
        ON c.t_id = t.t_id
    WHERE 
        t.t_name = 'Chang San'
)
SELECT 
    student_name,
    score,
    course_name
FROM 
    RankedScores
WHERE 
    ranking = 1;

--q8
SELECT 
    r1.s_id AS student_id,
    r1.c_id AS course_id_1,
    r2.c_id AS course_id_2,
    r1.s_score AS score
FROM 
    Score r1
JOIN 
    Score r2
    ON r1.s_id = r2.s_id
    AND r1.s_score = r2.s_score
    AND r1.c_id <> r2.c_id
ORDER BY 
    r1.s_id, r1.s_score;

--q9
WITH RankedScores AS (
    SELECT 
        c.c_id AS course_id,
        c.c_name AS course_name,
        s.s_name AS student_name,
        r.s_score AS score,
        ROW_NUMBER() OVER (PARTITION BY c.c_id ORDER BY r.s_score DESC) AS ranking
    FROM 
        Score r
    JOIN 
        Student s
        ON r.s_id = s.s_id
    JOIN 
        Course c
        ON r.c_id = c.c_id
)
SELECT 
    course_id,
    course_name,
    student_name,
    score
FROM 
    RankedScores
WHERE 
    ranking <= 2
ORDER BY 
    course_id, ranking;

--Q10
SELECT 
	*
FROM 
    Student s
WHERE 
    NOT EXISTS (
        SELECT 1
        FROM Course c
        WHERE NOT EXISTS (
            SELECT 1
            FROM Score r
            WHERE r.s_id = s.s_id AND r.c_id = c.c_id
        )
    );
