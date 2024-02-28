SELECT 
	s.id,
	s.fullname,
	AVG(g.grade) as average_grade
FROM students s 
JOIN grades g ON s.id = g.student_id 
GROUP BY s.id 
ORDER BY average_grade DESC
LIMIT 5;