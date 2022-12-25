SELECT
    ranked_by_group.ProductTopCategoryName AS "Product Top Category",
    ranked_by_group.ProductSubCategoryName AS "Product Sub Category",
    ranked_by_group.ProductModelName AS "Product Model",
    ranked_by_group.QuantitySold AS "Quantity Sold"
FROM (
    SELECT grouped.ProductTopCategoryName,
           grouped.ProductSubCategoryName,
           grouped.ProductModelName,
           grouped.QuantitySold,
           -- MySQL 8.0.0 and above supports Window-Functions like ROW_NUMBER() OVER
           -- Using Window-Functions to solve top-n-per-group problems is superior in terms of performance.
           ROW_NUMBER() OVER (
               PARTITION BY ProductTopCategoryName
               ORDER BY QuantitySold DESC
               ) group_rank
    FROM (
        SELECT
            ProductTopCategoryName,
            ProductSubCategoryName,
            ProductModelName,
            SUM(OrderQty) AS QuantitySold
        FROM BI_BikesDW_62.Fact_InternetSales
            JOIN BI_BikesDW_62.Dim_Product ON Fact_InternetSales.ProductKey = Dim_Product.ProductKey
        GROUP BY
            ProductTopCategoryName,
            ProductSubCategoryName,
            ProductModelName
         ) AS grouped
     ) AS ranked_by_group

WHERE ranked_by_group.group_rank <= 3
ORDER BY
    ProductTopCategoryName ASC,
    QuantitySold DESC;