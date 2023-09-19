-- REQUEST 8
-- 8.	In which quarter of 2020, got the maximum total_sold_quantity?

SELECT concat('Q', quarter(date_add(DATE, interval 4 month))) as Quarter, sum(sold_quantity)/1000000 as total_sold_quantity_in_Millions
FROM fact_sales_monthly
WHERE fiscal_year = '2020'
GROUP BY 1
ORDER BY 1;