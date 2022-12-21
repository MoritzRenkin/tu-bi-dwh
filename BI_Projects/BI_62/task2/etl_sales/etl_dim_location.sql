INSERT INTO
    BI_BikesDW_62.Dim_Location(LocationKey,
                               Country,
                               Region,
                               TaxRate,
                               ShipCoeff)
    SELECT DISTINCT
        CountryID,
        Country,
        Region,
        TaxRate,
        ShipCoeff
    FROM
        BI_Bikes_62.TB_Country country
;