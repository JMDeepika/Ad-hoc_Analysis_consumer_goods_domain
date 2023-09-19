-- Request 6
-- 6. Generate a report which contains the top 5 customers who received
-- an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market.

SELECT a.customer_code, b.customer, round(a.avg_discount_percentage, 4) as average_discount_percentage
FROM
	(SELECT i.customer_code, AVG(pre_invoice_discount_pct) as avg_discount_percentage
	FROM fact_pre_invoice_deductions i left join dim_customer c on c.customer_code = i.customer_code
	WHERE i.fiscal_year = 2021 AND c.market = 'India' group by i.customer_code order by 2 desc) a
INNER JOIN (SELECT customer, customer_code FROM dim_customer WHERE market = 'India') b
ON b.customer_code = a.customer_code
ORDER BY 3 DESC LIMIT 5;