/*
607. Sales Person
https://leetcode.com/problems/sales-person/
*/

Create table If Not Exists SalesPerson (sales_id int, name varchar(255), salary int, commission_rate int, hire_date date);
Create table If Not Exists Company (com_id int, name varchar(255), city varchar(255));
Create table If Not Exists Orders (order_id int, order_date date, com_id int, sales_id int, amount int);
Truncate table SalesPerson;
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('1', 'John', '100000', '6', STR_TO_DATE('4/1/2006', '%m/%d/%Y'));
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('2', 'Amy', '12000', '5', STR_TO_DATE('5/1/2010', '%m/%d/%Y'));
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('3', 'Mark', '65000', '12', STR_TO_DATE('12/25/2008', '%m/%d/%Y'));
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('4', 'Pam', '25000', '25', STR_TO_DATE('1/1/2005', '%m/%d/%Y'));
insert into SalesPerson (sales_id, name, salary, commission_rate, hire_date) values ('5', 'Alex', '5000', '10', STR_TO_DATE('2/3/2007', '%m/%d/%Y'));
Truncate table Company;
insert into Company (com_id, name, city) values ('1', 'RED', 'Boston');
insert into Company (com_id, name, city) values ('2', 'ORANGE', 'New York');
insert into Company (com_id, name, city) values ('3', 'YELLOW', 'Boston');
insert into Company (com_id, name, city) values ('4', 'GREEN', 'Austin');
Truncate table Orders;
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('1', STR_TO_DATE('1/1/2014', '%m/%d/%Y'), '3', '4', '10000');
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('2', STR_TO_DATE('2/1/2014', '%m/%d/%Y'), '4', '5', '5000');
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('3', STR_TO_DATE('3/1/2014', '%m/%d/%Y'), '1', '1', '50000');
insert into Orders (order_id, order_date, com_id, sales_id, amount) values ('4', STR_TO_DATE('4/1/2014', '%m/%d/%Y'), '1', '4', '25000');


# Write your MySQL query statement below
select distinct sp.name from SalesPerson sp
LEFT OUTER JOIN Orders o
ON o.sales_id = sp.sales_id
WHERE o.sales_id IS NULL
OR sp.sales_id NOT IN (
select sp.sales_id from SalesPerson sp
INNER JOIN Orders o
ON o.sales_id = sp.sales_id
INNER JOIN Company c
ON c.com_id=o.com_id
WHERE c.name="RED");

