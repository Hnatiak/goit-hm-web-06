SELECT 
    s.id AS subject_id,
    s.name AS subject_name,
    t.fullname AS teacher_name
FROM subjects s
JOIN teachers t ON s.teacher_id = t.id
WHERE t.fullname = 'Kelly Prince';