CREATE TABLE `BI_Bikes_62`.`TB_ProductSubCategory` (
  `ProductSubCategoryID` INT NOT NULL,
  `ProductTopCategoryID` INT NOT NULL,
  `Name` VARCHAR(50) NOT NULL,
  CONSTRAINT `PK_ProductSubCategory` PRIMARY KEY (`ProductSubCategoryID`),
  CONSTRAINT `FK_ProductTopCategory_ProductSubCategory`
    FOREIGN KEY (`ProductTopCategoryID`)
    REFERENCES `BI_Bikes_62`.`TB_ProductTopCategory` (`ProductTopCategoryID`));
