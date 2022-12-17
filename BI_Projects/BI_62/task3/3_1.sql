SELECT p.ProductTopCategoryName, SUM(f.OrderLineProfit) AS Profit
FROM BI_BikesDW_62.Fact_InternetSales f
JOIN BI_BikesDW_62.Dim_Product p
ON f.ProductKey = p.ProductKey
WHERE f.OrderDate BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY p.ProductTopCategoryName
ORDER BY TotalProfit DESC;