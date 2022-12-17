SELECT l.Country, SUM(f.OrderLineTotal) AS Revenue
FROM BI_BikesDW_62.Fact_InternetSales f
JOIN BI_BikesDW_62.Dim_Location l
ON f.ShipToLocationKey = l.LocationKey
WHERE f.OrderDate BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY l.Country
ORDER BY TotalRevenue DESC;