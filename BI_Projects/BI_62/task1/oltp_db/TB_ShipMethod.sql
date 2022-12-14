CREATE TABLE `BI_Bikes_62`.`TB_ShipMethod` (
  `ShipMethodID` INT NOT NULL,
  `ShipMethodName` VARCHAR(50) NOT NULL,
  `ShipBase` DECIMAL(13,4) NOT NULL,
  `ShipRate` DECIMAL(13,4) NOT NULL,
  CONSTRAINT `PK_ShipMethod` PRIMARY KEY (`ShipMethodID`));
