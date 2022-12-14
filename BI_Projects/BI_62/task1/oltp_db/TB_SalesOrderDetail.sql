CREATE TABLE `BI_Bikes_62`.`TB_SalesOrderDetail` (
  `SalesOrderDetailID` INT NOT NULL,
  `SalesOrderID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `OrderQty` INT NOT NULL,
  `UnitPrice` DECIMAL(13,4) NOT NULL,
  CONSTRAINT `PK_SalesOrderDetail` PRIMARY KEY (`SalesOrderDetailID`),
  CONSTRAINT `FK_SalesOrderHeader_SalesOrderDetail`
    FOREIGN KEY (`SalesOrderID`)
    REFERENCES `BI_Bikes_62`.`TB_SalesOrderHeader` (`SalesOrderID`),
  CONSTRAINT `FK_Product_SalesOrderDetail`
    FOREIGN KEY (`ProductID`)
    REFERENCES `BI_Bikes_62`.`TB_Product` (`ProductID`));
