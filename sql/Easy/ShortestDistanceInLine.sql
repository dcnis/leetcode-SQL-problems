/*
613. Shortest Distance in a Line
https://leetcode.com/problems/shortest-distance-in-a-line/
*/

// 482ms 6.19% faster than online submissions
select ABS(p1.x - p2.x) as shortest from Point p1 join Point p2 on p1.x != p2.x ORDER BY shortest limit 1;


// 249ms 55.68% faster than online submissions!!!!
select MIN(ABS(p1.x - p2.x)) as shortest from Point p1 join Point p2 on p1.x != p2.x;

// 207ms 92.65% faster than online submissions!!!!!!!!
select MIN(dif) as shortest from (select x - lag(x, 1) OVER (order by x) as dif FROM Point) as p2;