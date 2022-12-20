DROP TEMPORARY TABLE IF EXISTS temp_dates;
CREATE TEMPORARY TABLE temp_dates(
   all_dates DATE NOT NULL
);

INSERT INTO temp_dates
    SELECT
        ShipDate
    FROM
        BI_Bikes_62.TB_SalesOrderHeader
    UNION DISTINCT
        SELECT
            DueDate
        FROM
            BI_Bikes_62.TB_SalesOrderHeader
    UNION DISTINCT
        SELECT
            OrderDate
        FROM
            BI_Bikes_62.TB_SalesOrderHeader
    ORDER BY ShipDate;


INSERT INTO BI_BikesDW_62.Dim_Date(FullDateAlternateKey,
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
        all_dates,
        DAYOFWEEK(all_dates),
        DAYNAME(all_dates),
        DAYOFMONTH(all_dates),
        DAYOFYEAR(all_dates),
        WEEKOFYEAR(all_dates),
        MONTHNAME(all_dates),
        MONTH(all_dates),
        QUARTER(all_dates),
        YEAR(all_dates)
    FROM
        temp_dates;


DROP TEMPORARY TABLE temp_dates;