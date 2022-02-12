/*
570. Managers with at Least 5 Direct Reports
https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
*/

# Write your MySQL query statement below
WITH anzahl AS (select e1.name, e2.managerId from Employee e1
JOIN Employee e2
ON e1.id=e2.managerId)
SELECT name from anzahl group by name HAVING COUNT(managerId) >= 5;

select name from Employee WHERE id IN (
select managerId from Employee GROUP BY managerId HAVING COUNT(managerId) >=5);

