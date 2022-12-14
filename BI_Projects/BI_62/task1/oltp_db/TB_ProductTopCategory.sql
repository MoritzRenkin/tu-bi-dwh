CREATE TABLE `BI_Bikes_62`.`TB_ProductTopCategory` (
  `ProductTopCategoryID` INT NOT NULL,
  `Name` VARCHAR(50) NOT NULL,
  `ShipSurcharge` DECIMAL(13,4) NULL,
  CONSTRAINT `PK_ProductTopCategory` PRIMARY KEY (`ProductTopCategoryID`));
