-- Request 5
-- 5.	Get the products that have the highest and lowest manufacturing costs.

SELEcT c.product_code, p.product, c.manufacturing_cost
FROM fact_manufacturing_cost c
LEFT JOIN dim_product p
ON p.product_code = c.product_code
WHERE c.manufacturing_cost = (SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost) OR
		c.manufacturing_cost = (SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost);