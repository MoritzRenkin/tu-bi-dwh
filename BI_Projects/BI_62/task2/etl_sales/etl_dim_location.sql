INSERT INTO BI_BikesDW_62.Dim_Location(Country,
                                       Region,
                                       TaxRate,
                                       ShipCoeff)
    SELECT
        Country,
        Region,
        TaxRate,
        ShipCoeff
    FROM
        BI_Bikes_62.TB_Address address
        JOIN BI_Bikes_62.TB_Country country
            ON address.CountryID = country.CountryID

