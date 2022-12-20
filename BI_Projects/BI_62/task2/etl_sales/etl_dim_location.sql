INSERT INTO BI_BikesDW_62.Dim_Location
    SELECT
        Country,
        Region,
        TaxRate,
        ShipCoeff
    FROM
        BI_Bikes_62.TB_Address address
        JOIN BI_Bikes_62.TB_Country country
            ON address.CountryID = country.CountryID

