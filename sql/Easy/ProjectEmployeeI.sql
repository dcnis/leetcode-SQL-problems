/*
1075. Project Employees I
https://leetcode.com/problems/project-employees-i/
*/

select p.project_id, ROUND(AVG(e.experience_years), 2) as average_years from Project p
INNER JOIN Employee e ON p.employee_id=e.employee_id
GROUP BY project_id;