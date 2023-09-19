-- REQUEST 10
-- 10. Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021 ?

WITH cte AS
	(SELECT p.division, s.product_code, p.product, sum(sold_quantity) AS Total_sold_quantity,
	RANK() OVER(PARTITION BY division ORDER BY sum(sold_quantity) DESC) AS Rank_order
	FROM fact_sales_monthly s LEFT JOIN dim_product p ON p.product_code = s.product_code
	WHERE s.fiscal_year = 2021
	GROUP BY 1, 2, 3
    ORDER BY 4 DESC)
SELECT division, product_code, product, Total_sold_quantity, Rank_Order
FROM cte
WHERE rank_order <=3
ORDER BY 1, rank_order;