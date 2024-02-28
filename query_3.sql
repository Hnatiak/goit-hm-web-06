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