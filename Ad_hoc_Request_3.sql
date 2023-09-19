-- Request 3
-- 3. Provide a report with all the unique product counts for each segment and sort them in descending order of product counts.

SELECT segment, count(DISTINCT product_code) as product_count
FROM dim_product
GROUP BY 1
ORDER BY 2 DESC;