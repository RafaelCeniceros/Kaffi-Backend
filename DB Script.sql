-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Kaffi_database
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Kaffi_database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Kaffi_database` DEFAULT CHARACTER SET utf8 ;
USE `Kaffi_database` ;

-- -----------------------------------------------------
-- Table `Kaffi_database`.`tipos_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kaffi_database`.`tipos_usuarios` (
  `id_tipo_usuario` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre_tipo` VARCHAR(25) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Kaffi_database`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kaffi_database`.`usuarios` (
  `id_usuario` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(25) NOT NULL,
  `apellidos` VARCHAR(25) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NULL,
  `id_tipo_usuario` BIGINT NOT NULL,
  PRIMARY KEY (`id_usuario`, `id_tipo_usuario`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_usuarios_tipos_usuarios_idx` (`id_tipo_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_tipos_usuarios`
    FOREIGN KEY (`id_tipo_usuario`)
    REFERENCES `Kaffi_database`.`tipos_usuarios` (`id_tipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Kaffi_database`.`ordenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kaffi_database`.`ordenes` (
  `id_orden` BIGINT NOT NULL AUTO_INCREMENT,
  `monto_total` DECIMAL(9,2) NULL,
  `fecha_orden` TIMESTAMP NOT NULL,
  `id_usuario` BIGINT NOT NULL,
  PRIMARY KEY (`id_orden`),
  INDEX `fk_ordenes_usuarios1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_ordenes_usuarios1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `Kaffi_database`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Kaffi_database`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kaffi_database`.`categorias` (
  `id_categoria` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(25) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Kaffi_database`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kaffi_database`.`productos` (
  `id_producto` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` DECIMAL(9,2) NOT NULL,
  `descripcion` VARCHAR(120) NOT NULL,
  `img_url` VARCHAR(120) NOT NULL,
  `id_categoria` BIGINT NOT NULL,
  PRIMARY KEY (`id_producto`),
  INDEX `fk_productos_categorias1_idx` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_productos_categorias1`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `Kaffi_database`.`categorias` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Kaffi_database`.`ordenes_has_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kaffi_database`.`ordenes_has_productos` (
  `id_orden` BIGINT NOT NULL,
  `id_producto` BIGINT NOT NULL,
  `cantidad` INT NOT NULL,
  `precio_unitario` DECIMAL(9,2) NOT NULL,
  `total` DECIMAL(9,2) NOT NULL,
  PRIMARY KEY (`id_orden`, `id_producto`),
  INDEX `fk_ordenes_has_productos_productos1_idx` (`id_producto` ASC) VISIBLE,
  INDEX `fk_ordenes_has_productos_ordenes1_idx` (`id_orden` ASC) VISIBLE,
  CONSTRAINT `fk_ordenes_has_productos_ordenes1`
    FOREIGN KEY (`id_orden`)
    REFERENCES `Kaffi_database`.`ordenes` (`id_orden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordenes_has_productos_productos1`
    FOREIGN KEY (`id_producto`)
    REFERENCES `Kaffi_database`.`productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
