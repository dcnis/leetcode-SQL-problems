/*
550. Game Play Analysis IV
https://leetcode.com/problems/game-play-analysis-iv/
*/


WITH countLogins AS (
    WITH firstLoginTable AS (
        select distinct player_id,
        first_value(event_date) over (partition by player_id order by event_date) as firstLogIn
        from Activity),
    secondLoginTable AS (
        select distinct player_id,
        nth_value(event_date, 2) over (partition by player_id order by event_date) as secondLogIn
        from Activity) select count(f.player_id) as countPlayer from firstLoginTable as f INNER JOIN secondLoginTable as s
        ON f.player_id = s.player_id
        WHERE firstLogin IS NOT NULL
        AND secondLogin IS NOT NULL
        AND TIMESTAMPDIFF(DAY, f.firstLogin, s.secondLogin) = 1
),
countTotalPlayers AS (
  select count(distinct(player_id)) as totalAmountOfPlayer from Activity
) select ROUND(countPlayer/totalAmountOfPlayer, 2) as fraction from countLogins, countTotalPlayers;


select ROUND(count(t2.player_id)/count(t1.player_id),2) from
(
SELECT player_id, MIN(event_date) AS first_login FROM Activity GROUP BY player_id) as t1
LEFT JOIN Activity as t2
ON t1.player_id = t2.player_id
AND t1.first_login = t2.event_date-1;