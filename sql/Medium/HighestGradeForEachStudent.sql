/*
1112. Highest Grade For Each Student
https://leetcode.com/problems/highest-grade-for-each-student/
*/

-- First solution
select student_id, MIN(course_id) as course_id, grade from
	(select student_id, course_id, grade from
		(select *, RANK() OVER (partition by student_id order by grade desc) as r from Enrollments ORDER BY student_id) sub
	WHERE r=1) subsub
GROUP BY student_id, grade;


-- Second solution
select student_id, course_id, grade from
		(select *, RANK() OVER (partition by student_id order by grade desc, course_id asc) as r from Enrollments ORDER BY student_id) sub
WHERE r=1;

