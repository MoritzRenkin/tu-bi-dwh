SELECT l.Region, c.FullName AS "Customer Name", SUM(f.OrderQty) AS "Quantity Sold"
FROM BI_BikesDW_62.Fact_InternetSales f
JOIN BI_BikesDW_62.Dim_Location l
ON f.ShipToLocationKey = l.LocationKey
JOIN BI_BikesDW_62.Dim_Customer c
ON f.CustomerKey = c.CustomerKey
WHERE l.Country = 'Europe'
GROUP BY c.FullName
ORDER BY "Quantity Sold" DESC
LIMIT 5;