SELECT
    Country,
    CalendarYear AS Year,
    EnglishMonthName AS Month,
    SUM(OrderLineShippingCost) AS "Shipping costs"
FROM
    BI_BikesDW_62.Fact_InternetSales InternetSales
    JOIN BI_BikesDW_62.Dim_Location Location ON InternetSales.ShipToLocationKey = Location.LocationKey
    JOIN BI_BikesDW_62.Dim_Date Date ON InternetSales.OrderDateKey = Date.DateKey

WHERE Country = 'United Kingdom'
    AND ShipMethod = 'Cargo International'
    AND CalendarYear = 2020
    AND MonthNumberOfYear BETWEEN 1 AND 6
GROUP BY Year, Month;
