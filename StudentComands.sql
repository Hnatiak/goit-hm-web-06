SELECT 
	s.id,
	s.fullname,
	AVG(g.grade) as average_grade
FROM students s 
JOIN grades g ON s.id = g.student_id 
GROUP BY s.id 
ORDER BY average_grade DESC
LIMIT 5;

SELECT 
	s.id,
	s.fullname,
	ROUND(AVG(g.grade), 2) as average_grade
FROM grades g 
JOIN students s ON s.id = g.student_id
where g.subject_id = 1
GROUP BY s.id 
ORDER BY average_grade DESC
LIMIT 1;

SELECT 
    g.subject_id,
    grp.name AS group_name,
    ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g
JOIN students s ON s.id = g.student_id
JOIN groups grp ON s.group_id = grp.id
WHERE g.subject_id = 1
GROUP BY g.subject_id, grp.name
ORDER BY g.subject_id, average_grade DESC;


SELECT ROUND(AVG(grade), 2) AS average_grade_overall
FROM grades;

SELECT 
    s.id AS subject_id,
    s.name AS subject_name,
    t.fullname AS teacher_name
FROM subjects s
JOIN teachers t ON s.teacher_id = t.id
WHERE t.fullname = 'Kelly Prince';

SELECT 
    s.id AS student_id,
    s.fullname AS student_name,
    g.name AS group_name
FROM students s
JOIN groups g ON s.group_id = g.id
WHERE g.name = 'bank';

SELECT 
    s.id AS student_id,
    s.fullname AS student_name,
    g.grade,
    sub.name AS subject_name
FROM grades g
JOIN students s ON g.student_id = s.id
JOIN subjects sub ON g.subject_id = sub.id
JOIN groups grp ON s.group_id = grp.id
WHERE 
    grp.name = 'bank'
    AND sub.id = 2;
    
SELECT 
    t.fullname AS teacher_name,
    ROUND(AVG(g.grade), 2) AS average_grade
FROM teachers t
JOIN subjects s ON t.id = s.teacher_id
JOIN grades g ON s.id = g.subject_id
GROUP BY t.fullname;

SELECT 
    s.id AS student_id,
    s.fullname AS student_name,
    sub.name AS subject_name
FROM students s
JOIN grades g ON s.id = g.student_id
JOIN subjects sub ON g.subject_id = sub.id
WHERE s.fullname = 'Kathy Ayala';

SELECT 
    s.fullname AS student_name,
    t.fullname AS teacher_name,
    sub.name AS subject_name
FROM students s
JOIN grades g ON s.id = g.student_id
JOIN subjects sub ON g.subject_id = sub.id
JOIN teachers t ON sub.teacher_id = t.id
WHERE 
    s.fullname = 'Jacob Rodriguez'
    AND t.fullname = 'Kelly Prince';


