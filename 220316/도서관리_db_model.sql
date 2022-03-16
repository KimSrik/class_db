-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 도서관리_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 도서관리_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `도서관리_DB` DEFAULT CHARACTER SET utf8 ;
USE `도서관리_DB` ;

-- -----------------------------------------------------
-- Table `도서관리_DB`.`회원정보`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `도서관리_DB`.`회원정보` (
  `회원번호` VARCHAR(5) NOT NULL,
  `회원이름` VARCHAR(20) NULL,
  `주소` VARCHAR(50) NULL,
  `전화번호` VARCHAR(20) NULL,
  PRIMARY KEY (`회원번호`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `도서관리_DB`.`도서정보`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `도서관리_DB`.`도서정보` (
  `도서시리얼넘버` VARCHAR(5) NOT NULL,
  `도서명` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`도서시리얼넘버`),
  UNIQUE INDEX `도서명_UNIQUE` (`도서명` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `도서관리_DB`.`주문회원`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `도서관리_DB`.`주문회원` (
  `주문번호` VARCHAR(11) NOT NULL,
  `주문날짜` DATE NULL,
  `회원번호` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`주문번호`, `회원번호`),
  INDEX `fk_주문회원_회원정보1_idx` (`회원번호` ASC) VISIBLE,
  CONSTRAINT `fk_주문회원_회원정보1`
    FOREIGN KEY (`회원번호`)
    REFERENCES `도서관리_DB`.`회원정보` (`회원번호`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `도서관리_DB`.`주문회원_has_회원정보`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `도서관리_DB`.`주문회원_has_회원정보` (
  `주문번호` VARCHAR(11) NOT NULL,
  `회원번호` VARCHAR(5) NOT NULL,
  `도서시리얼넘버` VARCHAR(5) NOT NULL,
  `수량` INT NULL,
  `단가` INT NULL,
  PRIMARY KEY (`주문번호`, `회원번호`),
  INDEX `fk_주문회원_has_회원정보_회원정보1_idx` (`회원번호` ASC) VISIBLE,
  INDEX `fk_주문회원_has_회원정보_주문회원_idx` (`주문번호` ASC) VISIBLE,
  INDEX `fk_주문회원_has_회원정보_도서정보1_idx` (`도서시리얼넘버` ASC) VISIBLE,
  CONSTRAINT `fk_주문회원_has_회원정보_주문회원`
    FOREIGN KEY (`주문번호`)
    REFERENCES `도서관리_DB`.`주문회원` (`주문번호`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_주문회원_has_회원정보_회원정보1`
    FOREIGN KEY (`회원번호`)
    REFERENCES `도서관리_DB`.`회원정보` (`회원번호`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_주문회원_has_회원정보_도서정보1`
    FOREIGN KEY (`도서시리얼넘버`)
    REFERENCES `도서관리_DB`.`도서정보` (`도서시리얼넘버`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
