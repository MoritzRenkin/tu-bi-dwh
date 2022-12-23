SELECT
    grouped_ranked.ProductTopCategoryName,
    grouped_ranked.ProductModelName,
    grouped_ranked.QuantitySold
FROM (
    SELECT grouped.ProductTopCategoryName,
           grouped.ProductModelName,
           grouped.QuantitySold,
           -- MySQL 8.0.0 and above support Window functions like ROW_NUMBER() OVER
           -- Using Window functions to solve top-n-per-group problems is generally preferable due to performance considerations
           ROW_NUMBER() OVER (
               PARTITION BY ProductTopCategoryName
               ORDER BY QuantitySold DESC
               ) ranked_order
    FROM (
        SELECT
            ProductTopCategoryName,
            ProductModelName,
            SUM(OrderQty) AS QuantitySold
        FROM BI_BikesDW_62.Fact_InternetSales
            JOIN BI_BikesDW_62.Dim_Product
                ON Fact_InternetSales.ProductKey = Dim_Product.ProductKey
        GROUP BY ProductTopCategoryName, ProductModelName
         ) AS grouped
     ) AS grouped_ranked

WHERE grouped_ranked.ranked_order <= 3
ORDER BY ProductTopCategoryName ASC, QuantitySold DESC;
