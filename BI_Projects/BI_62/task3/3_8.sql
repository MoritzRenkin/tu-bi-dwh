SELECT
    CalendarYear AS "Calendar Year",
    EnglishMonthName AS Month,
    Country,
    SUM(OrderLineTaxAmt) AS "Tax Amount"

FROM BI_BikesDW_62.Fact_InternetSales InternetSales
    JOIN BI_BikesDW_62.Dim_Location ShipLocation ON InternetSales.ShipToLocationKey = ShipLocation.LocationKey
    JOIN BI_BikesDW_62.Dim_Date Date ON InternetSales.OrderDateKey = Date.DateKey
WHERE
    (Country = 'France' OR Country = 'Germany')
    AND CalendarYear = 2021
    AND MonthNumberOfYear BETWEEN 1 AND 6
GROUP BY
    CalendarYear,
    EnglishMonthName,
    Country
;