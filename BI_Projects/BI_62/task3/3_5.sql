SELECT l.Country, SUM(f.OrderLineShippingCost) AS TotalShippingCost
FROM BI_BikesDW_62.Fact_InternetSales f
JOIN BI_BikesDW_62.Dim_Location l
ON f.ShipToLocationKey = l.LocationKey
WHERE l.Country = 'United Kingdom' AND f.ShipMethod = 'Cargo International' AND
      f.OrderDate BETWEEN '2020-01-01' AND '2020-06-30'
GROUP BY l.Country;
