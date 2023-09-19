-- Request 7
-- 7. Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month.
--    This analysis helps to get an idea of low and high-performing months and take strategic decisions.

WITH sales_monthly AS
	(select monthname(S.date) as month, extract(year from S.date) as year, (S.sold_quantity * G.gross_price) as Gross_sales_amount
	FROM fact_sales_monthly S
    LEFT JOIN dim_customer C ON C.customer_code = S.customer_code
	JOIN fact_gross_price G ON G.product_code = S.product_code
	WHERE C.customer = 'Atliq Exclusive')
SELECT S.month as Month , S.year as Year, SUM(S.Gross_sales_amount) as Gross_sales_Amount
FROM sales_monthly S
GROUP BY 1, 2
ORDER BY 2, 1;