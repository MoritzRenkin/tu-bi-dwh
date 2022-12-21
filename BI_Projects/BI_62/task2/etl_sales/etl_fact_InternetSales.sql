INSERT INTO
    BI_BikesDW_62.Fact_InternetSales(SalesOrderLineNumber,
                                     SalesOrderNumber,
                                     OrderDateKey,
                                     OrderDate,
                                     DueDateKey,
                                     DueDate,
                                     ShipDateKey,
                                     ShipDate,
                                     ProductKey,
                                     CustomerKey,
                                     ShipToLocationKey,
                                     OrderStatus,
                                     ShipMethod,
                                     OrderQty,
                                     UnitPrice,
                                     OrderLineTotal,
                                     OrderLineProfit,
                                     OrderLineTaxAmt,
                                     OrderLineShippingCost)
    SELECT
        CONCAT('SOL', SalesOrderDetail.SalesOrderID, '-', SalesOrderDetailID) AS SalesOrderLineNumber,
        SalesOrderDetail.SalesOrderID AS SalesOrderNumber, -- TODO check
        10000 * Year(OrderDate) + 100 * Month(OrderDate) + DayOfMonth(OrderDate) AS OrderDateKey,
        OrderDate,
        10000 * Year(DueDate) + 100 * Month(DueDate) + DayOfMonth(DueDate) AS DueDateKey,
        DueDate,
        10000 * Year(ShipDate) + 100 * Month(ShipDate) + DayOfMonth(ShipDate) AS ShipDateKey,
        ShipDate,
        SalesOrderDetail.ProductID AS ProductKey,
        CustomerID AS CustomerKey,
        Country.CountryID AS ShipToLocationKey,
        OrderStatusName AS OrderStatus,
        ShipMethodName AS ShipMethod,
        OrderQty,
        UnitPrice,
        @OrderLineTotal:= CAST(OrderQty * UnitPrice AS FLOAT) AS OrderLineTotal,
        @OrderLineTotal - OrderQty * StandardCost AS OrderLineProfit,
        @OrderLineTotal * TaxRate AS OrderLineTaxAmount,
        ShipSurcharge + ShipBase + (OrderQty * ShipRate * ShipCoeff) AS OrderLineShippingCost

    FROM
        BI_Bikes_62.TB_SalesOrderDetail SalesOrderDetail

        JOIN BI_Bikes_62.TB_SalesOrderHeader SalesOrderHeader
            ON SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID
        JOIN BI_Bikes_62.TB_Address ShippingAdress
            ON SalesOrderHeader.ShipToAddressID = ShippingAdress.AddressID
        JOIN BI_Bikes_62.TB_Country Country
            ON ShippingAdress.CountryID = Country.CountryID
        JOIN BI_Bikes_62.TB_OrderStatus OrderStatus
            ON SalesOrderHeader.OrderStatusID = OrderStatus.OrderStatusID
        JOIN BI_Bikes_62.TB_ShipMethod ShipMethod
            ON SalesOrderHeader.ShipMethodID = ShipMethod.ShipMethodID

        JOIN BI_Bikes_62.TB_Product Product
            ON SalesOrderDetail.ProductID = Product.ProductID
        JOIN BI_Bikes_62.TB_ProductSubCategory ProductSubCategory
            ON Product.ProductSubCategoryID = ProductSubCategory.ProductSubCategoryID
        JOIN BI_Bikes_62.TB_ProductTopCategory ProductTopCategory
            ON ProductSubCategory.ProductTopCategoryID = ProductTopCategory.ProductTopCategoryID
;
