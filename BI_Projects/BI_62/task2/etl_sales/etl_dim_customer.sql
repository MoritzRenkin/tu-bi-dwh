INSERT INTO
    BI_BikesDW_62.Dim_Customer(CustomerKey,
                               AccountNumber,
                               FullName,
                               Gender,
                               Age)
    SELECT
        CustomerID,
        AccountNumber,
        CONCAT(
            FirstName, ' ',
            IF(MiddleName IS NULL OR MiddleName='',
                '', -- avoid extra spaces in case there is no middle name
                CONCAT(MiddleName, ' ')
            ),
            LastName
        ) AS FullName,
        Gender,
        YEAR('2021-09-30') - YEAR(Birthdate)
            - (DAYOFYEAR('2021-09-30') < DAYOFYEAR(Birthdate)) -- bool is cast to int

    FROM
        BI_Bikes_62.TB_Customer customer
        JOIN BI_Bikes_62.TB_Person person
            ON customer.PersonID = person.PersonID
;

