/*
610. Triangle Judgement
https://leetcode.com/problems/triangle-judgement/
*/

# Write your MySQL query statement below
select x, y, z,
CASE
	WHEN x+y>z AND x+z>y AND z+y>x THEN "Yes"
    ELSE "No"
	END
AS triangle
from Triangle;

select *, IF (x+y>z AND x+z>y AND z+y>x, "Yes", "No") as triangle from Triangle;
