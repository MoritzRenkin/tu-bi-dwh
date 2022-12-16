CREATE TABLE `BI_BikesDW_62`.`Dim_Customer` (
  `CustomerKey` INT NOT NULL,
  `AccountNumber` VARCHAR(30) NOT NULL,
  `FullName` VARCHAR(150) NOT NULL,
  `Gender` VARCHAR(1) NOT NULL,
  `Age` INT NOT NULL,
  CONSTRAINT `PK_DimCustomer` PRIMARY KEY (`CustomerKey`));
