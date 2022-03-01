/*
1098. Unpopular Books
https://leetcode.com/problems/unpopular-books/

Learning: Man kann zunächst subqueries machen und sich so eigene Tabellen bauen, indem man ihnen einen Namen gibt.
Danach kann man diese Tabellen JOINEN.

*/

select a.book_id, a.name from

    // books, die länger als 1 Monat available sind
	(select * from Books
     	WHERE available_from < '2019-05-23') a

    LEFT OUTER JOIN

    // orders, im letzten Jahr
	(select * from Orders o
	WHERE dispatch_date >= '2018-06-23' AND dispatch_date <= '2019-06-23') b

    ON a.book_id = b.book_id

    // Berechnungen auf die zwei subqueries durchführen
    GROUP BY a.book_id, a.name
	HAVING SUM(quantity) < 10 OR SUM(quantity) IS NULL;