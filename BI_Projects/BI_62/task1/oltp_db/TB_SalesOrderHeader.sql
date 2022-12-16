CREATE TABLE `BI_Bikes_62`.`TB_SalesOrderHeader` (
  `SalesOrderID` INT NOT NULL,
  `SalesOrderNumber` VARCHAR(30) NOT NULL,
  `OrderDate` DATE NOT NULL,
  `DueDate` DATE NOT NULL,
  `ShipDate` DATE NULL,
  `OrderStatusID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `BillToAddressID` INT NOT NULL,
  `ShipToAddressID` INT NOT NULL,
  `ShipMethodID` INT NOT NULL,
  CONSTRAINT `PK_SalesOrderHeader` PRIMARY KEY (`SalesOrderID`),
  CONSTRAINT `FK_OrderStatus_SalesOrderHeader`
    FOREIGN KEY (`OrderStatusID`)
    REFERENCES `BI_Bikes_62`.`TB_OrderStatus` (`OrderStatusID`),
  CONSTRAINT `FK_Customer_SalesOrderHeader`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `BI_Bikes_62`.`TB_Customer` (`CustomerID`),
  CONSTRAINT `FK_BillToAddress_SalesOrderHeader`
    FOREIGN KEY (`BillToAddressID`)
    REFERENCES `BI_Bikes_62`.`TB_Address` (`AddressID`),
  CONSTRAINT `FK_ShipToAddress_SalesOrderHeader`
    FOREIGN KEY (`ShipToAddressID`)
    REFERENCES `BI_Bikes_62`.`TB_Address` (`AddressID`),
  CONSTRAINT `FK_ShipMethod_Address`
    FOREIGN KEY (`ShipMethodID`)
    REFERENCES `BI_Bikes_62`.`TB_ShipMethod` (`ShipMethodID`));
