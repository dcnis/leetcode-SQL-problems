/*
580. Count Student Number in Departments
https://leetcode.com/problems/count-student-number-in-departments/
*/

// Problem is here if there are departments with the same dept_name

select d.dept_name, COUNT(s.student_id) as student_number from Department d
LEFT OUTER JOIN Student s
ON d.dept_id=s.dept_id
GROUP BY d.dept_name
ORDER BY student_number DESC, d.dept_name;

// Better solution because groups by dept_id
select dept_name, IF(student_number IS NOT NULL, student_number, 0) as student_number from Department
LEFT OUTER JOIN (SELECT dept_id, COUNT(dept_id) as student_number from Student GROUP BY dept_id) as s1
ON Department.dept_id=s1.dept_id
ORDER BY student_number DESC, dept_name;
