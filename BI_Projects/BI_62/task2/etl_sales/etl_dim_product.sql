INSERT INTO
    BI_BikesDW_62.Dim_Product(ProductKey,
                              ProductName,
                              ProductModelName,
                              ProductSubCategoryName,
                              ProductTopCategoryName,
                              StandardCost,
                              ListPrice,
                              StartDate,
                              EndDate,
                              ProductStatus)
    SELECT
        ProductID,
        ProductName,
        ProductModelName,
        SubCategory.Name,
        TopCategory.Name,
        StandardCost,
        ListPrice,
        SellStartDate,
        SellEndDate,
        IF(ISNULL(SellEndDate) OR DATE(SellEndDate) > '2021-09-30',
            'Current',
            'Discontinued'
            )
    FROM
        BI_Bikes_62.TB_Product Product
        JOIN BI_Bikes_62.TB_ProductModel ProductModel
            ON Product.ProductModelID = ProductModel.ProductModelID
        JOIN BI_Bikes_62.TB_ProductSubCategory SubCategory
            ON SubCategory.ProductSubCategoryID = Product.ProductSubCategoryID
        JOIN BI_Bikes_62.TB_ProductTopCategory TopCategory
            ON SubCategory.ProductTopCategoryID = TopCategory.ProductTopCategoryID
;