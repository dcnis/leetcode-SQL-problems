/*
1083. Sales Analysis II
https://leetcode.com/problems/sales-analysis-ii/
*/

-- First solution --
select distinct buyer_id from Sales
WHERE buyer_id IN
(select buyer_id from Sales
INNER JOIN Product USING(product_id)
WHERE Product.product_name="S8")

AND buyer_id NOT IN

(select buyer_id from Sales
INNER JOIN Product USING(product_id)
WHERE Product.product_name="iPhone");




-- Second solution --
select distinct buyer_id from Sales
INNER JOIN Product USING(product_id)
WHERE Product.product_name="S8"

AND buyer_id NOT IN

(select buyer_id from Sales
INNER JOIN Product USING(product_id)
WHERE Product.product_name="iPhone");


-- Third solution --
select buyer_id from Sales s
INNER JOIN Product p USING (product_id)
GROUP BY buyer_id
HAVING SUM(p.product_name="iPhone")=0 AND SUM(p.product_name="S8")>0;
