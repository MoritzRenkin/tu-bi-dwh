INSERT INTO
    BI_BikesDW_62.Dim_Date(FullDateAlternateKey,
                           DateKey,
                           DayNumberOfWeek,
                           EnglishDayNameOfWeek,
                           DayNumberOfMonth,
                           DayNumberOfYear,
                           WeekNumberOfYear,
                           EnglishMonthName,
                           MonthNumberOfYear,
                           CalendarQuarter,
                           CalendarYear)
    SELECT
        @date:=AllDates.Date AS FullDateAlternateKey,
        YEAR(@date) * 10000 + MONTH(@date) * 100 + DAYOFMONTH(@date) AS DateKey,
        DAYOFWEEK(@date) AS DayNumberOfWeek,
        DAYNAME(@date) AS EnglishDayNameOfWeek,
        DAYOFMONTH(@date) AS DayNumberOfMonth,
        DAYOFYEAR(@date) AS DayNumberOfYear,
        WEEKOFYEAR(@date) AS WeekNumberOfYear,
        MONTHNAME(@date) AS EnglishMonthName,
        MONTH(@date) AS MonthNumberOfYear,
        QUARTER(@date) AS CalendarQuarter,
        YEAR(@date) AS CalendarYear
    FROM (
        SELECT
            ShipDate AS Date
        FROM
            BI_Bikes_62.TB_SalesOrderHeader
        UNION DISTINCT

            SELECT
                DueDate
            FROM
                BI_Bikes_62.TB_SalesOrderHeader
        UNION
            SELECT
                OrderDate
            FROM
                BI_Bikes_62.TB_SalesOrderHeader
         ) AS AllDates
;
