/*
586. Customer Placing the Largest Number of Orders
https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/
*/

WITH bigCustomer AS (
    select customer_number, COUNT(order_number) as orders from Orders GROUP BY customer_number order by orders desc limit 1)
select customer_number from bigCustomer;

SELECT
    customer_number
FROM
    orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1;