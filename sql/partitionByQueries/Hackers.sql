/*
CREATE table Hackers (
h_id int,
h_name VARCHAR(255),
challenge_id date,
score int,
Primary key (h_id, challenge_id)
);

INSERT INTO Hackers VALUES (3,'shubh', 111, 20);
INSERT INTO Hackers VALUES (2,'aayush', 111, 80);
INSERT INTO Hackers VALUES (5,'krithik', 112, 40);
INSERT INTO Hackers VALUES (5,'krithik', 114, 90);
INSERT INTO Hackers VALUES (4,'tushar', 112, 30);
INSERT INTO Hackers VALUES (1,'parth', 112, 40);


https://www.geeksforgeeks.org/mysql-partition-by-clause/#:~:text=A%20PARTITION%20BY%20clause%20is,used%20inside%20OVER()%20clause.

*/

select challenge_id, h_id, h_name, score,
dense_rank() over (partition by challenge_id order by score desc)
from Hackers;


INPUT:
h_id	h_name	challenge_id	score
3	shubh	111	20
2	aayush	111	80
5	krithik	112	40
5	krithik	114	90
4	tushar	112	30
1	parth	112	40


OUTPUT:
challenge_id	h_id	h_name	score	dense_rank() over (partition by challenge_id order by score desc)
111	2	aayush	80	1
111	3	shubh	20	2
112	1	parth	40	1
112	5	krithik	40	1
112	4	tushar	30	2
114	5	krithik	90	1


