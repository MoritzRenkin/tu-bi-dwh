CREATE TABLE `BI_BikesDW_62`.`Dim_Location` (
  `LocationKey` INT NOT NULL AUTO_INCREMENT,
  `Country` VARCHAR(50) NOT NULL,
  `Region` VARCHAR(50) NOT NULL,
  `TaxRate` DECIMAL(13,4) NULL,
  `ShipCoeff` DECIMAL(13,4) NULL,
  CONSTRAINT `PK_DimLocation` PRIMARY KEY (`LocationKey`));
