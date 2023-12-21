-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tipos_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipos_usuarios` (
  `id_tipo_usuario` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre_tipo` VARCHAR(25) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuarios` (
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
    REFERENCES `mydb`.`tipos_usuarios` (`id_tipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ordenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ordenes` (
  `id_orden` BIGINT NOT NULL AUTO_INCREMENT,
  `monto_total` DECIMAL(9,2) NULL,
  `fecha_orden` TIMESTAMP NOT NULL,
  `id_usuario` BIGINT NOT NULL,
  PRIMARY KEY (`id_orden`),
  INDEX `fk_ordenes_usuarios1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_ordenes_usuarios1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mydb`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categorias` (
  `id_categoria` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(25) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`productos` (
  `id_producto` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` DECIMAL(9,2) NOT NULL,
  `descripcion` VARCHAR(60) NOT NULL,
  `img_url` VARCHAR(120) NOT NULL,
  `id_categoria` BIGINT NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE,
  INDEX `fk_productos_categorias1_idx` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_productos_categorias1`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `mydb`.`categorias` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ordenes_has_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ordenes_has_productos` (
  `id_orden` BIGINT NOT NULL,
  `id_producto` BIGINT NOT NULL,
  `cantidad` INT NOT NULL,
  `precio_unitario` DECIMAL(9,2) NOT NULL,
  `total` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_orden`, `id_producto`),
  INDEX `fk_ordenes_has_productos_productos1_idx` (`id_producto` ASC) VISIBLE,
  INDEX `fk_ordenes_has_productos_ordenes1_idx` (`id_orden` ASC) VISIBLE,
  CONSTRAINT `fk_ordenes_has_productos_ordenes1`
    FOREIGN KEY (`id_orden`)
    REFERENCES `mydb`.`ordenes` (`id_orden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordenes_has_productos_productos1`
    FOREIGN KEY (`id_producto`)
    REFERENCES `mydb`.`productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
