INSERT INTO BI_BikesDW_62.Dim_Customer(AccountNumber,
                                       FullName,
                                       Gender,
                                       Age)
SELECT
    AccountNumber,
    CONCAT(
        FirstName, " ",
        IF(
            MiddleName IS NULL OR MiddleName='',
            "", -- avoid extra spaces in case there is no middle name
            CONCAT(MiddleName, " ")
        ),
        LastName
    ) AS FullName,
    Gender,
    YEAR(CURRENT_DATE) - YEAR(Birthdate)
        - (DAYOFYEAR(CURRENT_DATE) < DAYOFYEAR(Birthdate))
    AS Age

FROM
    BI_Bikes_62.TB_Customer customer
    JOIN BI_Bikes_62.TB_Person person
        ON customer.PersonID = person.PersonID
;