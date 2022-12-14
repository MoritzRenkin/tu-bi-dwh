CREATE TABLE `BI_Bikes_62`.`TB_Person` (
  `PersonID` INT NOT NULL,
  `FirstName` VARCHAR(50) NOT NULL,
  `MiddleName` VARCHAR(50) NULL,
  `LastName` VARCHAR(50) NOT NULL,
  `Gender` VARCHAR(1) NULL,
  `Birthdate` DATE NULL,
  CONSTRAINT `PK_Person` PRIMARY KEY (`PersonID`));
