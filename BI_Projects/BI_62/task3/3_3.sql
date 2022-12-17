SELECT c.FullName AS "Customer Name", SUM(f.OrderLineProfit) AS "Profit"
FROM BI_BikesDW_62.Fact_InternetSales f
JOIN BI_BikesDW_62.Dim_Customer c
ON f.CustomerKey = c.CustomerKey
WHERE f.OrderDate BETWEEN '2021-01-01' AND '2021-06-30'
GROUP BY c.FullName
ORDER BY Profit DESC
LIMIT 10;