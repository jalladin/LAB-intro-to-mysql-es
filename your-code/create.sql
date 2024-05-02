DROP DATABASE IF EXISTS cars;
CREATE DATABASE cars; 
USE cars;

-- -----------------------------------------------------
-- Table `cars`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`cars` (
  `car_id` INT NOT NULL,
  `manufacturer` VARCHAR(20) NOT NULL,
  `model` VARCHAR(20) NOT NULL,
  `year_` INT NOT NULL,
  `color` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`car_id`));


-- -----------------------------------------------------
-- Table `cars`.`costumer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`costumer` (
  `costumer_id` INT NOT NULL,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20),
  `phone_no` VARCHAR(20) NULL DEFAULT NULL,
  `email` VARCHAR(20) NULL DEFAULT NULL,
  `address` VARCHAR(40) NULL DEFAULT NULL,
  `city` VARCHAR(20) NULL DEFAULT NULL,
  `state` VARCHAR(20) NULL DEFAULT NULL,
  `country` VARCHAR(20) NULL DEFAULT NULL,
  `zip_code` VARCHAR(20) NULL DEFAULT NULL,
  `client` INT NULL DEFAULT NULL,
  PRIMARY KEY (`costumer_id`));


  
  -- -----------------------------------------------------
-- Table `cars`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`salesperson` (
  `salesperson_id` INT NOT NULL,
  `first_name` VARCHAR(40) NOT NULL,
  `store_name` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`salesperson_id`));

- -----------------------------------------------------
-- Table `cars`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`invoices` (
  `invoice_id` INT NOT NULL,
  `date_` DATE NULL DEFAULT NULL,
  `car` VARCHAR(20) NOT NULL,
  `costumer` VARCHAR(20) NULL DEFAULT NULL,
  `salesperson` VARCHAR(20) NULL DEFAULT NULL,
  `salesperson_salesperson_id` INT NOT NULL,
  `cars_car_id` INT NOT NULL,
  `costumer_costumer_id` INT NOT NULL,
  PRIMARY KEY (`invoice_id`),
  INDEX `fk_invoices_salesperson_idx` (`salesperson_salesperson_id` ASC) VISIBLE,
  INDEX `fk_invoices_cars1_idx` (`cars_car_id` ASC) VISIBLE,
  INDEX `fk_invoices_costumer1_idx` (`costumer_costumer_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_salesperson`
    FOREIGN KEY (`salesperson_salesperson_id`)
    REFERENCES `cars`.`salesperson` (`salesperson_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_cars1`
    FOREIGN KEY (`cars_car_id`)
    REFERENCES `cars`.`cars` (`car_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_costumer1`
    FOREIGN KEY (`costumer_costumer_id`)
    REFERENCES `cars`.`costumer` (`costumer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



