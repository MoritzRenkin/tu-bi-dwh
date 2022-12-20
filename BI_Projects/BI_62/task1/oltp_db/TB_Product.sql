CREATE TABLE `BI_Bikes_62`.`TB_Product` (
  `ProductID` INT NOT NULL,
  ProductName VARCHAR(50) NOT NULL,
  `ProductNumber` VARCHAR(50) NOT NULL,
  `StandardCost` DECIMAL(13,4) NOT NULL,
  `ListPrice` DECIMAL(13,4) NOT NULL,
  `ProductSubCategoryID` INT NULL,
  `ProductModelID` INT NULL,
  `SellStartDate` DATE NOT NULL,
  `SellEndDate` DATE NULL,
  CONSTRAINT `PK_Product` PRIMARY KEY (`ProductID`),
  CONSTRAINT `FK_ProductSubCategory_Product`
    FOREIGN KEY (`ProductSubCategoryID`)
    REFERENCES `BI_Bikes_62`.`TB_ProductSubCategory` (`ProductSubCategoryID`),
  CONSTRAINT `FK_ProductModel_Product`
    FOREIGN KEY (`ProductModelID`)
    REFERENCES `BI_Bikes_62`.`TB_ProductModel` (`ProductModelID`));
