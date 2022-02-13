/*
1045. Customers Who Bought All Products
https://leetcode.com/problems/customers-who-bought-all-products/
*/

select distinct customer_id from Customer group by customer_id HAVING COUNT(distinct product_key)=(select COUNT(*) from Product);