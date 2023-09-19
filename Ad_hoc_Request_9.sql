-- Request 9
-- 9. Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?

WITH cte_table as 
	(SELECT C.channel, SUM(sold_quantity * gross_price) as total_sold
	FROM fact_sales_monthly S
	LEFT JOIN dim_customer C ON C.customer_code = S.customer_code
	LEFT JOIN fact_gross_price P ON P.product_code = S.product_code
	WHERE S.fiscal_year = 2021
	GROUP BY 1)
SELECT
channel, ROUND(total_sold) as gross_sales_mln,
ROUND(total_sold*100/(SELEct sum(total_sold) FROM cte_table), 2) as percentage
FROM cte_table
ORDER BY 2 DESC;