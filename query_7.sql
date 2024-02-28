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