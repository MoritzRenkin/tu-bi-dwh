CREATE TABLE `BI_BikesDW_62`.`Fact_InternetSales` (
  `SalesOrderLineNumber` VARCHAR(50) NOT NULL AUTO_INCREMENT,
  `SalesOrderNumber` VARCHAR(30) NOT NULL,
  `OrderDateKey` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `DueDateKey` INT NOT NULL,
  `DueDate` DATE NOT NULL,
  `ShipDateKey` INT NULL,
  `ShipDate` DATE NULL,
  `ProductKey` INT NOT NULL,
  `CustomerKey` INT NOT NULL,
  `ShipToLocationKey` INT NOT NULL,
  `OrderStatus` VARCHAR(50) NOT NULL,
  `ShipMethod` VARCHAR(50) NOT NULL,
  `OrderQty` INT NOT NULL,
  `UnitPrice` DECIMAL(13,4) NOT NULL,
  `OrderLineTotal` DECIMAL(13,4) NOT NULL,
  `OrderLineProfit` DECIMAL(13,4) NOT NULL,
  `OrderLineTaxAmt` DECIMAL(13,4) NOT NULL,
  `OrderLineShippingCost` DECIMAL(13,4) NOT NULL,
  CONSTRAINT `PK_FactInternetSales` PRIMARY KEY (`SalesOrderLineNumber`),
  CONSTRAINT `FK_Customer_FactInternetSales`
    FOREIGN KEY (`CustomerKey`)
    REFERENCES `BI_BikesDW_62`.`Dim_Customer` (`CustomerKey`),
  CONSTRAINT `FK_Location_FactInternetSales`
    FOREIGN KEY (`ShipToLocationKey`)
    REFERENCES `BI_BikesDW_62`.`Dim_Location` (`LocationKey`),
  CONSTRAINT `FK_Product_FactInternetSales`
    FOREIGN KEY (`ProductKey`)
    REFERENCES `BI_BikesDW_62`.`Dim_Product` (`ProductKey`),
  CONSTRAINT `FK_OrderDate_FactInternetSales`
    FOREIGN KEY (`OrderDateKey`)
    REFERENCES `BI_BikesDW_62`.`Dim_Date` (`DateKey`),
  CONSTRAINT `FK_DueDate_FactInternetSales`
    FOREIGN KEY (`DueDateKey`)
    REFERENCES `BI_BikesDW_62`.`Dim_Date` (`DateKey`),
  CONSTRAINT `FK_ShipDate_FactInternetSales`
    FOREIGN KEY (`ShipDateKey`)
    REFERENCES `BI_BikesDW_62`.`Dim_Date` (`DateKey`));
