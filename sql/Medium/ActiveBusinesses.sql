-- 1126. Active Businesses
-- https://leetcode.com/problems/active-businesses/

-- Solution 1



EXPLAIN select business_id from
	(select * FROM
		(SELECT business_id, a.event_type, SUM(occurences) as mysum
		FROM Events a
		GROUP BY business_id, event_type
		ORDER BY business_id) each_businessId_with_its_events_and_its_occurrence

		JOIN

		(SELECT event_type, (summer/counter) as average FROM
			(select event_type, COUNT(event_type) as counter, SUM(occurences) as summer from Events
			GROUP BY event_type) sub) average_of_each_event_type

		USING(event_type)
		WHERE mysum > average
		ORDER BY business_id) subsub

GROUP BY business_id
HAVING COUNT(*) >= 2;


-- Solution 2
WITH a AS
(SELECT *, CASE WHEN occurences > AVG(occurences) OVER (partition by event_type)
THEN 1 ELSE 0 END AS chosen
 FROM Events ORDER BY business_id)
 select business_id from a
 GROUP BY business_id
HAVING SUM(chosen) >= 2;