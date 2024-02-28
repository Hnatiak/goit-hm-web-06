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