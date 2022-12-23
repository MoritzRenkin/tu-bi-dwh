SELECT
    *
FROM
    (
    SELECT
        ProductTopCategoryName,
        ProductSubCategoryName,
        ProductModelName,
        SUM(OrderQty) AS QuantitySold
    FROM
        BI_BikesDW_62.Fact_InternetSales
    JOIN BI_BikesDW_62.Dim_Product
        ON Fact_InternetSales.ProductKey = Dim_Product.ProductKey
    GROUP BY ProductTopCategoryName, ProductSubCategoryName,ProductModelName
    ORDER BY QuantitySold DESC

    ) AS ordered_by_QuantitySold

