/*
603. Consecutive Available Seats
https://leetcode.com/problems/consecutive-available-seats/
*/
Create table If Not Exists Cinema (seat_id int primary key auto_increment, free bool)
Truncate table Cinema
insert into Cinema (seat_id, free) values ('1', '1')
insert into Cinema (seat_id, free) values ('2', '0')
insert into Cinema (seat_id, free) values ('3', '1')
insert into Cinema (seat_id, free) values ('4', '1')
insert into Cinema (seat_id, free) values ('5', '1')

select
distinct c1.seat_id
from Cinema c1 JOIN Cinema c2
ON c1.seat_id = c2.seat_id+1 OR c1.seat_id = c2.seat_id-1
WHERE c1.free = true AND c2.free = true;