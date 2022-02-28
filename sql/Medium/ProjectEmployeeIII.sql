/*
1077. Project Employees III
https://leetcode.com/problems/project-employees-iii/
*/

with A as (select p.project_id, p.employee_id, e.name, e.experience_years, RANK() OVER(partition by p.project_id order by e.experience_years desc) as place from Project p
INNER JOIN Employee e ON p.employee_id=e.employee_id)
select project_id, employee_id from A WHERE place=1;

select project_id, employee_id from
(select p.project_id, p.employee_id, e.name, e.experience_years, RANK() OVER(partition by p.project_id order by e.experience_years desc) as place from Project p
INNER JOIN Employee e ON p.employee_id=e.employee_id) a
WHERE a.place=1;