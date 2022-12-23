SELECT
    grouped_ranked.ProductTopCategoryName AS "Product Top Category",
    grouped_ranked.ProductSubCategoryName AS "Product Sub Category",
    grouped_ranked.ProductModelName AS "Product Model",
    grouped_ranked.QuantitySold AS "Quantity Sold"
FROM (
    SELECT grouped.ProductTopCategoryName,
           grouped.ProductSubCategoryName,
           grouped.ProductModelName,
           grouped.QuantitySold,
           -- MySQL 8.0.0 and above support Window functions like ROW_NUMBER() OVER
           -- Using Window functions to solve top-n-per-group problems is preferred due to performance considerations
           ROW_NUMBER() OVER (
               PARTITION BY ProductTopCategoryName
               ORDER BY QuantitySold DESC
               ) ranked_order
    FROM (
        SELECT
            ProductTopCategoryName,
            ProductSubCategoryName,
            ProductModelName,
            SUM(OrderQty) AS QuantitySold
        FROM BI_BikesDW_62.Fact_InternetSales
            JOIN BI_BikesDW_62.Dim_Product
                ON Fact_InternetSales.ProductKey = Dim_Product.ProductKey
        GROUP BY
            ProductTopCategoryName,
            ProductSubCategoryName,
            ProductModelName
         ) AS grouped
     ) AS grouped_ranked

WHERE grouped_ranked.ranked_order <= 3
ORDER BY
    ProductTopCategoryName ASC,
    QuantitySold DESC;