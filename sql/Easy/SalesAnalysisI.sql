/*
1082. Sales Analysis I
https://leetcode.com/problems/sales-analysis-i/
*/


select seller_id from Sales GROUP BY seller_id
HAVING SUM(price) =
(select MAX(sold) as max_sold from
(select seller_id, SUM(price) as sold from Sales GROUP BY seller_id) S);


/* Mit RANK() Function */
SELECT seller_id from
(select seller_id, RANK() OVER (ORDER BY SUM(price) DESC) as ranky from Sales GROUP BY seller_id) sub
WHERE ranky=1;