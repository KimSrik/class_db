-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 병원_업무_관리
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 병원_업무_관리
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `병원_업무_관리` DEFAULT CHARACTER SET utf8 ;
USE `병원_업무_관리` ;

-- -----------------------------------------------------
-- Table `병원_업무_관리`.`의사`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `병원_업무_관리`.`의사` (
  `의사ID` VARCHAR(10) NOT NULL,
  `담당진료과목` VARCHAR(20) NOT NULL,
  `성명` VARCHAR(20) NOT NULL,
  `성별` VARCHAR(10) NOT NULL,
  `연락처` VARCHAR(20) NOT NULL,
  `이메일` VARCHAR(20) NULL,
  `직급` VARCHAR(10) NULL,
  PRIMARY KEY (`의사ID`),
  UNIQUE INDEX `의사ID_UNIQUE` (`의사ID` ASC) VISIBLE,
  UNIQUE INDEX `연락처_UNIQUE` (`연락처` ASC) VISIBLE,
  UNIQUE INDEX `이메일_UNIQUE` (`이메일` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `병원_업무_관리`.`간호사`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `병원_업무_관리`.`간호사` (
  `간호사ID` VARCHAR(10) NOT NULL,
  `담당업무` VARCHAR(40) NOT NULL,
  `성명` VARCHAR(20) NOT NULL,
  `성별` VARCHAR(10) NOT NULL,
  `이메일` VARCHAR(20) NOT NULL,
  `직급` VARCHAR(10) NULL,
  PRIMARY KEY (`간호사ID`),
  UNIQUE INDEX `간호사ID_UNIQUE` (`간호사ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `병원_업무_관리`.`환자`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `병원_업무_관리`.`환자` (
  `환자ID` VARCHAR(10) NOT NULL,
  `환자성명` VARCHAR(20) NOT NULL,
  `주민번호` VARCHAR(14) NOT NULL,
  `성별` VARCHAR(10) NOT NULL,
  `주소` VARCHAR(50) NOT NULL,
  `연락처` VARCHAR(20) NOT NULL,
  `이메일` VARCHAR(20) NULL,
  `직업` VARCHAR(20) NULL,
  `간호사_간호사ID` VARCHAR(10) NOT NULL,
  `의사_의사ID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`환자ID`),
  UNIQUE INDEX `환자ID_UNIQUE` (`환자ID` ASC) VISIBLE,
  UNIQUE INDEX `주민번호_UNIQUE` (`주민번호` ASC) VISIBLE,
  INDEX `fk_환자_간호사_idx` (`간호사_간호사ID` ASC) VISIBLE,
  INDEX `fk_환자_의사1_idx` (`의사_의사ID` ASC) VISIBLE,
  CONSTRAINT `fk_환자_간호사`
    FOREIGN KEY (`간호사_간호사ID`)
    REFERENCES `병원_업무_관리`.`간호사` (`간호사ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_환자_의사1`
    FOREIGN KEY (`의사_의사ID`)
    REFERENCES `병원_업무_관리`.`의사` (`의사ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `병원_업무_관리`.`진료차트`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `병원_업무_관리`.`진료차트` (
  `차트번호` INT NOT NULL,
  `의사소견` VARCHAR(500) NOT NULL,
  `의사_의사ID` VARCHAR(10) NOT NULL,
  `환자_환자ID` VARCHAR(10) NOT NULL,
  `간호사_간호사ID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`차트번호`),
  INDEX `fk_진료차트_의사1_idx` (`의사_의사ID` ASC) VISIBLE,
  INDEX `fk_진료차트_환자1_idx` (`환자_환자ID` ASC) VISIBLE,
  INDEX `fk_진료차트_간호사1_idx` (`간호사_간호사ID` ASC) VISIBLE,
  CONSTRAINT `fk_진료차트_의사1`
    FOREIGN KEY (`의사_의사ID`)
    REFERENCES `병원_업무_관리`.`의사` (`의사ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_진료차트_환자1`
    FOREIGN KEY (`환자_환자ID`)
    REFERENCES `병원_업무_관리`.`환자` (`환자ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_진료차트_간호사1`
    FOREIGN KEY (`간호사_간호사ID`)
    REFERENCES `병원_업무_관리`.`간호사` (`간호사ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `병원_업무_관리`.`진료`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `병원_업무_관리`.`진료` (
  `의사_의사ID` VARCHAR(10) NOT NULL,
  `환자_환자ID` VARCHAR(10) NOT NULL,
  `진료 ID` INT NOT NULL,
  `진료내용` VARCHAR(100) NOT NULL,
  `진료날짜` DATE NOT NULL,
  `진료차트_차트번호` INT NOT NULL,
  PRIMARY KEY (`의사_의사ID`, `환자_환자ID`, `진료 ID`),
  INDEX `fk_환자 has 환자_의사1_idx` (`의사_의사ID` ASC) VISIBLE,
  INDEX `fk_환자 has 환자_환자1_idx` (`환자_환자ID` ASC) VISIBLE,
  INDEX `fk_진료_진료차트1_idx` (`진료차트_차트번호` ASC) VISIBLE,
  CONSTRAINT `fk_환자 has 환자_의사1`
    FOREIGN KEY (`의사_의사ID`)
    REFERENCES `병원_업무_관리`.`의사` (`의사ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_환자 has 환자_환자1`
    FOREIGN KEY (`환자_환자ID`)
    REFERENCES `병원_업무_관리`.`환자` (`환자ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_진료_진료차트1`
    FOREIGN KEY (`진료차트_차트번호`)
    REFERENCES `병원_업무_관리`.`진료차트` (`차트번호`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
