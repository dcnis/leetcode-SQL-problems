-- 1141. User Activity for the Past 30 Days I
-- https://leetcode.com/problems/user-activity-for-the-past-30-days-i/

-- Solution 1 (without optimization) faster than 20%
select activity_date as 'day', count(distinct(user_id)) as active_users from Activity GROUP BY activity_date
HAVING activity_date <= '2019-07-27'
AND activity_date > DATE_SUB('2019-07-27', INTERVAL 30 DAY)
AND active_users != 0;


-- Solution 2. We can only group by of the rows, we really care about (activity_date in the last 30 days)
-- Faster than 88% !!!
select activity_date as 'day', count(distinct(user_id)) as active_users from
(select activity_date, user_id from Activity
WHERE activity_date <= '2019-07-27'
AND activity_date > DATE_SUB('2019-07-27', INTERVAL 30 DAY)) sub
GROUP BY activity_date
HAVING active_users > 0;


-- Solution 3.  Faster than 90%
select activity_date as 'day', count(distinct(user_id)) as active_users from
(select activity_date, user_id from Activity
WHERE activity_date <= '2019-07-27'
AND activity_date > DATE_SUB('2019-07-27', INTERVAL 30 DAY)) sub
GROUP BY activity_date;

-- Solution 4: Removed unnecessary wrapper query
-- Faster than 95%
select activity_date as 'day', count(distinct(user_id)) as active_users from Activity
WHERE activity_date <= '2019-07-27'
AND activity_date > DATE_SUB('2019-07-27', INTERVAL 30 DAY)
GROUP BY activity_date;