/*
1384. Total Sales Amount by Year
https://leetcode.com/problems/total-sales-amount-by-year/
*/

select s1.product_id, p.product_name, s1.report_year, s1.total_amount from
(select product_id, '2018' as report_year, (DATEDIFF(LEAST(period_end, '2018-12-31'), GREATEST(period_start, '2018-01-01'))+1) * average_daily_sales as total_amount from Sales WHERE YEAR(period_start)=2018 or YEAR(period_end)=2018

UNION ALL

 select product_id, '2019' as report_year, (DATEDIFF(LEAST(period_end, '2019-12-31'), GREATEST(period_start, '2019-01-01'))+1) * average_daily_sales as total_amount from Sales
    WHERE YEAR(period_start)=2019
    OR YEAR(period_end)=2019
	OR (YEAR(period_start)=2018 AND YEAR(period_end)=2020)

UNION ALL

select product_id, '2020' as report_year, (DATEDIFF(LEAST(period_end, '2020-12-31'), GREATEST(period_start, '2020-01-01'))+1) * average_daily_sales as total_amount from Sales WHERE YEAR(period_start)=2020 or YEAR(period_end)=2020
) as s1
INNER JOIN Product p on s1.product_id = p.product_id
ORDER BY s1.product_id, report_year;
