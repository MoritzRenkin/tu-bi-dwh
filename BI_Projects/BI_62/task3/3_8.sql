SELECT
  MONTH(OrderDate) AS OrderMonth,
  SUM(OrderLineTaxAmt) AS TotalTaxAmount
FROM BI_BikesDW_62.Fact_InternetSales InternetSales
    JOIN BI_BikesDW_62.Dim_Location Location
    ON InternetSales.ShipToLocationKey = Location.LocationKey
WHERE
    (Country = 'France' OR Country = 'Germany')
    AND OrderDate BETWEEN '2021-01-01' AND '2021-06-30'
GROUP BY OrderMonth
