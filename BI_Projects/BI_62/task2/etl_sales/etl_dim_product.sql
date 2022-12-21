SELECT
    ProductName,
    ProductModelName,
    SubCategory.Name,
    TopCategory.Name,

FROM
    BI_Bikes_62.TB_Product Product
    JOIN BI_Bikes_62.TB_ProductModel ProductModel
        ON Product.ProductModelID = ProductModel.ProductModelID
    JOIN BI_Bikes_62.TB_ProductSubCategory SubCategory
        ON SubCategory.ProductSubCategoryID = Product.ProductSubCategoryID
    JOIN BI_Bikes_62.TB_ProductTopCategory TopCategory
        ON SubCategory.ProductTopCategoryID = TopCategory.ProductTopCategoryID