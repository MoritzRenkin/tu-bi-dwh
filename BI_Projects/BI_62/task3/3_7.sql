SELECT l.Country, SUM(f.OrderLineProfit) AS Profit
FROM BI_BikesDW_62.Fact_InternetSales f
JOIN BI_BikesDW_62.Dim_Location l
ON f.ShipToLocationKey = l.LocationKey
WHERE f.UnitPrice BETWEEN 1000 AND 2000
GROUP BY l.Country
ORDER BY Profit DESC
LIMIT 3;