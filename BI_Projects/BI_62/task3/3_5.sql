SELECT
    MONTH(OrderDate) AS OrderMonth,
    SUM(OrderLineShippingCost) AS TotalShippingCost
FROM
    BI_BikesDW_62.Fact_InternetSales
    JOIN BI_BikesDW_62.Dim_Location
        ON Fact_InternetSales.ShipToLocationKey = Dim_Location.LocationKey
WHERE Country = 'United Kingdom'
    AND ShipMethod = 'Cargo International'
    AND OrderDate BETWEEN '2020-01-01' AND '2020-06-30'
GROUP BY OrderMonth;