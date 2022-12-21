CREATE TABLE `BI_BikesDW_62`.`Dim_Product` (
  `ProductKey` INT NOT NULL,
  `ProductName` VARCHAR(50) NOT NULL,
  `ProductModelName` VARCHAR(50) NOT NULL,
  `ProductSubCategoryName` VARCHAR(50) NOT NULL,
  `ProductTopCategoryName` VARCHAR(50) NOT NULL,
  `StandardCost` DECIMAL(13,4) NOT NULL,
  `ListPrice` DECIMAL(13,4) NOT NULL,
  `StartDate` DATE NOT NULL,
  `EndDate` DATE NULL,
  `ProductStatus` VARCHAR(50) NOT NULL,
  CONSTRAINT `PK_DimProduct` PRIMARY KEY (`ProductKey`));
