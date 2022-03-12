/*
1084. Sales Analysis III
https://leetcode.com/problems/sales-analysis-iii/
*/

-- First solution --
select distinct s.product_id, p.product_name From Sales s
INNER JOIN Product p USING (product_id)
WHERE sale_date between "2019-01-01" AND "2019-03-31"
	AND product_id NOT IN
		(SELECT product_id from Sales WHERE sale_date < "2019-01-01" OR sale_date > "2019-03-31");


-- Second solution --
select s.product_id, p.product_name from Sales s
INNER JOIN Product p USING (product_id) GROUP BY product_id, p.product_name
HAVING MIN(sale_date) >= "2019-01-01" AND MAX(sale_date) <= "2019-03-31";

-- Third solution
SELECT product_id, product_name from Product WHERE product_id IN
(select s.product_id from Sales s
INNER JOIN Product p USING (product_id) GROUP BY product_id
HAVING MIN(sale_date) >= "2019-01-01" AND MAX(sale_date) <= "2019-03-31");