--  Request 2
-- 2. What is the percentage of unique product increase in 2021 vs. 2020 ?

-- Method # 1 Using Sub queries
SELECT
sub_1.unique_product_count as unique_products_2020,
sub_2.unique_product_count as unique_products_2021,
round((sub_2.unique_product_count - sub_1.unique_product_count)*100/sub_1.unique_product_count, 4) as percentage_change
FROM
((select fiscal_year, COUNT(DISTINCT product_code) as unique_product_count from fact_sales_monthly
Group by fiscal_year HAVING fiscal_year = 2020) AS sub_1,
(select fiscal_year, COUNT(DISTINCT product_code) as unique_product_count from fact_sales_monthly
Group by fiscal_year HAVING fiscal_year = 2021) AS sub_2);

-- Method # 2 Using CTE's and Cross Join
WITH unique_products AS
(select fiscal_year, COUNT(DISTINCT product_code) AS unique_product_count
FROM fact_sales_monthly
GROUP BY fiscal_year)
SELECT
u1.unique_product_count as unique_products_2020, u2.unique_product_count as unique_products_2021,
(u2.unique_product_count - u1.unique_product_count)*100/u1.unique_product_count as percentage_change
FROM unique_products u1 CROSS JOIN unique_products u2
WHERE u2.fiscal_year = 2021 and u1.fiscal_year = 2020;