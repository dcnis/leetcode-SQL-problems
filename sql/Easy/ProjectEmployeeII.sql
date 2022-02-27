/*
1076. Project Employees II
https://leetcode.com/problems/project-employees-ii/
*/

select project_id from Project p
GROUP BY project_id
HAVING COUNT(employee_id) = (select COUNT(*) as c from Project GROUP BY project_id ORDER BY c desc limit 1);