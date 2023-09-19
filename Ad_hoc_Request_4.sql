-- Request 4
-- 4. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020?
-- SQL Query using CTE's 

WITH segment_unique_products AS
(SELECT p.segment, s.fiscal_year, COUNT(DISTINCT s.product_code) as product_counts
FROM dim_product p
RIGHT JOIN fact_sales_monthly s ON s.product_code=p.product_code
GROUP BY 1, 2)
SELECT
	s1.segment, s1.product_counts as product_count_2020, s2.product_counts as product_count_2021,
	(s2.product_counts-s1.product_counts) as difference
    FROM segment_unique_products s1 CROSS JOIN segment_unique_products s2
    ON s1.segment = s2.segment WHERE s1.fiscal_year = 2020 AND s2.fiscal_year = 2021;