/*
1083. Sales Analysis II
https://leetcode.com/problems/sales-analysis-ii/
*/

select distinct buyer_id from Sales
WHERE buyer_id IN
(select buyer_id from Sales
INNER JOIN Product USING(product_id)
WHERE Product.product_name="S8")

AND buyer_id NOT IN

(select buyer_id from Sales
INNER JOIN Product USING(product_id)
WHERE Product.product_name="iPhone");

