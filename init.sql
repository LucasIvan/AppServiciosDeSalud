-- MySQL Script generated by MySQL Workbench
-- Fri Nov 17 14:11:00 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema AppServicioSaludData
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `AppServicioSaludData` ;

-- -----------------------------------------------------
-- Schema AppServicioSaludData
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AppServicioSaludData` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `AppServicioSaludData` ;

-- -----------------------------------------------------
-- Table `AppServicioSaludData`.`imagen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AppServicioSaludData`.`imagen` ;

CREATE TABLE IF NOT EXISTS `AppServicioSaludData`.`imagen` (
  `id` VARCHAR(255) NOT NULL,
  `contenido` LONGBLOB NULL DEFAULT NULL,
  `mime` VARCHAR(255) NULL DEFAULT NULL,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `AppServicioSaludData`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AppServicioSaludData`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `AppServicioSaludData`.`usuarios` (
  `tipo_usuario` VARCHAR(31) NOT NULL,
  `id` VARCHAR(255) NOT NULL,
  `activo` BIT(1) NULL DEFAULT NULL,
  `apellido` VARCHAR(255) NULL DEFAULT NULL,
  `dni` VARCHAR(8) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_alta` DATE NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `rol` VARCHAR(255) NULL DEFAULT NULL,
  `sexo` VARCHAR(255) NULL DEFAULT NULL,
  `telefono` VARCHAR(255) NULL DEFAULT NULL,
  `obra_social` VARCHAR(255) NULL DEFAULT NULL,
  `descripcion` VARCHAR(255) NULL DEFAULT NULL,
  `especialidad` VARCHAR(255) NULL DEFAULT NULL,
  `matricula_profesional` VARCHAR(255) NULL DEFAULT NULL,
  `obras_sociales` VARCHAR(255) NULL DEFAULT NULL,
  `imagen_id` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UK_ggd9d47p8x7m0ajavk1ayuyqs` (`dni` ASC) VISIBLE,
  UNIQUE INDEX `UK_kfsp0s1tflm1cwlj8idhqsad0` (`email` ASC) VISIBLE,
  UNIQUE INDEX `UK_hxeiq675gno0d586c87dt80vg` (`matricula_profesional` ASC) VISIBLE,
  INDEX `FK4u8xj079p2ex2su9o274vc0xp` (`imagen_id` ASC) VISIBLE,
  CONSTRAINT `FK4u8xj079p2ex2su9o274vc0xp`
    FOREIGN KEY (`imagen_id`)
    REFERENCES `AppServicioSaludData`.`imagen` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `AppServicioSaludData`.`calificacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AppServicioSaludData`.`calificacion` ;

CREATE TABLE IF NOT EXISTS `AppServicioSaludData`.`calificacion` (
  `id` VARCHAR(255) NOT NULL,
  `comentario` VARCHAR(255) NULL DEFAULT NULL,
  `valor` INT NOT NULL,
  `paciente_id` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKcykip0t9sb52ps8bo5i8gg5ce` (`paciente_id` ASC) VISIBLE,
  CONSTRAINT `FKcykip0t9sb52ps8bo5i8gg5ce`
    FOREIGN KEY (`paciente_id`)
    REFERENCES `AppServicioSaludData`.`usuarios` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `AppServicioSaludData`.`historia_clinica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AppServicioSaludData`.`historia_clinica` ;

CREATE TABLE IF NOT EXISTS `AppServicioSaludData`.`historia_clinica` (
  `id` VARCHAR(255) NOT NULL,
  `historia` VARCHAR(255) NULL DEFAULT NULL,
  `paciente_id` VARCHAR(255) NULL DEFAULT NULL,
  `profesional_id` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKi357fpjra9vunnf5m20k37dws` (`paciente_id` ASC) VISIBLE,
  INDEX `FKk9nvc728hs3rpu33dkewkpbgy` (`profesional_id` ASC) VISIBLE,
  CONSTRAINT `FKi357fpjra9vunnf5m20k37dws`
    FOREIGN KEY (`paciente_id`)
    REFERENCES `AppServicioSaludData`.`usuarios` (`id`),
  CONSTRAINT `FKk9nvc728hs3rpu33dkewkpbgy`
    FOREIGN KEY (`profesional_id`)
    REFERENCES `AppServicioSaludData`.`usuarios` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `AppServicioSaludData`.`notificaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AppServicioSaludData`.`notificaciones` ;

CREATE TABLE IF NOT EXISTS `AppServicioSaludData`.`notificaciones` (
  `id` VARCHAR(255) NOT NULL,
  `fecha_emision` DATE NULL DEFAULT NULL,
  `leido` BIT(1) NOT NULL,
  `mensaje` VARCHAR(255) NULL DEFAULT NULL,
  `remitente` VARCHAR(255) NULL DEFAULT NULL,
  `resumen` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `AppServicioSaludData`.`oferta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AppServicioSaludData`.`oferta` ;

CREATE TABLE IF NOT EXISTS `AppServicioSaludData`.`oferta` (
  `id` VARCHAR(255) NOT NULL,
  `detalle` VARCHAR(255) NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `horario` VARCHAR(255) NULL DEFAULT NULL,
  `precio` DOUBLE NULL DEFAULT NULL,
  `reservado` BIT(1) NULL DEFAULT NULL,
  `tipo` VARCHAR(255) NULL DEFAULT NULL,
  `ubicacion` VARCHAR(255) NULL DEFAULT NULL,
  `profesional_id` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK88y1t8uchi7mqqk7ecjkb5vnh` (`profesional_id` ASC) VISIBLE,
  CONSTRAINT `FK88y1t8uchi7mqqk7ecjkb5vnh`
    FOREIGN KEY (`profesional_id`)
    REFERENCES `AppServicioSaludData`.`usuarios` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `AppServicioSaludData`.`permiso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AppServicioSaludData`.`permiso` ;

CREATE TABLE IF NOT EXISTS `AppServicioSaludData`.`permiso` (
  `id` VARCHAR(255) NOT NULL,
  `permiso` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `AppServicioSaludData`.`profesional_calificacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AppServicioSaludData`.`profesional_calificacion` ;

CREATE TABLE IF NOT EXISTS `AppServicioSaludData`.`profesional_calificacion` (
  `id_profesional` VARCHAR(255) NOT NULL,
  `id_calificacion` VARCHAR(255) NOT NULL,
  INDEX `FK44xf1rb4pmxvfr5phge5bq735` (`id_calificacion` ASC) VISIBLE,
  INDEX `FK15n9fa6bq51ckd0sffqplb59a` (`id_profesional` ASC) VISIBLE,
  CONSTRAINT `FK15n9fa6bq51ckd0sffqplb59a`
    FOREIGN KEY (`id_profesional`)
    REFERENCES `AppServicioSaludData`.`usuarios` (`id`),
  CONSTRAINT `FK44xf1rb4pmxvfr5phge5bq735`
    FOREIGN KEY (`id_calificacion`)
    REFERENCES `AppServicioSaludData`.`calificacion` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `AppServicioSaludData`.`turno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AppServicioSaludData`.`turno` ;

CREATE TABLE IF NOT EXISTS `AppServicioSaludData`.`turno` (
  `id` VARCHAR(255) NOT NULL,
  `fecha_turno` DATE NULL DEFAULT NULL,
  `estado` VARCHAR(255) NULL DEFAULT NULL,
  `fecha_alta` DATE NULL DEFAULT NULL,
  `hora_turno` INT NULL DEFAULT NULL,
  `observaciones` VARCHAR(255) NULL DEFAULT NULL,
  `oferta_id` VARCHAR(255) NULL DEFAULT NULL,
  `paciente_id` VARCHAR(255) NULL DEFAULT NULL,
  `profesional_id` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKt7q8e4j97acbxkww42pccltcw` (`oferta_id` ASC) VISIBLE,
  INDEX `FKe47qkei9ndascx97t9krkkta5` (`paciente_id` ASC) VISIBLE,
  INDEX `FK4owh5c3chnm93y4nq6kdwxeja` (`profesional_id` ASC) VISIBLE,
  CONSTRAINT `FK4owh5c3chnm93y4nq6kdwxeja`
    FOREIGN KEY (`profesional_id`)
    REFERENCES `AppServicioSaludData`.`usuarios` (`id`),
  CONSTRAINT `FKe47qkei9ndascx97t9krkkta5`
    FOREIGN KEY (`paciente_id`)
    REFERENCES `AppServicioSaludData`.`usuarios` (`id`),
  CONSTRAINT `FKt7q8e4j97acbxkww42pccltcw`
    FOREIGN KEY (`oferta_id`)
    REFERENCES `AppServicioSaludData`.`oferta` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `AppServicioSaludData`.`profesional_turno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AppServicioSaludData`.`profesional_turno` ;

CREATE TABLE IF NOT EXISTS `AppServicioSaludData`.`profesional_turno` (
  `id_profesional` VARCHAR(255) NOT NULL,
  `id_turno` VARCHAR(255) NOT NULL,
  INDEX `FKk2ihotyg62qqi4giefwy5anvi` (`id_turno` ASC) VISIBLE,
  INDEX `FKcfq2q3d7vkuxuk3egtpdeii9w` (`id_profesional` ASC) VISIBLE,
  CONSTRAINT `FKcfq2q3d7vkuxuk3egtpdeii9w`
    FOREIGN KEY (`id_profesional`)
    REFERENCES `AppServicioSaludData`.`usuarios` (`id`),
  CONSTRAINT `FKk2ihotyg62qqi4giefwy5anvi`
    FOREIGN KEY (`id_turno`)
    REFERENCES `AppServicioSaludData`.`turno` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `AppServicioSaludData`.`registro_consulta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AppServicioSaludData`.`registro_consulta` ;

CREATE TABLE IF NOT EXISTS `AppServicioSaludData`.`registro_consulta` (
  `id` VARCHAR(255) NOT NULL,
  `detalle_consulta` VARCHAR(255) NULL DEFAULT NULL,
  `fecha_consulta` TIMESTAMP NULL DEFAULT NULL,
  `historia_clinica_id` VARCHAR(255) NULL DEFAULT NULL,
  `profesional_id` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK43w3yth7f6vg710ov1c9mkolj` (`historia_clinica_id` ASC) VISIBLE,
  INDEX `FK661lwaa3gykd1x1np4bhqqn0b` (`profesional_id` ASC) VISIBLE,
  CONSTRAINT `FK43w3yth7f6vg710ov1c9mkolj`
    FOREIGN KEY (`historia_clinica_id`)
    REFERENCES `AppServicioSaludData`.`historia_clinica` (`id`),
  CONSTRAINT `FK661lwaa3gykd1x1np4bhqqn0b`
    FOREIGN KEY (`profesional_id`)
    REFERENCES `AppServicioSaludData`.`usuarios` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `AppServicioSaludData`.`usuarios_notificaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AppServicioSaludData`.`usuarios_notificaciones` ;

CREATE TABLE IF NOT EXISTS `AppServicioSaludData`.`usuarios_notificaciones` (
  `usuario_id` VARCHAR(255) NOT NULL,
  `notificaciones_id` VARCHAR(255) NOT NULL,
  UNIQUE INDEX `UK_36mrkqsnns35m3k6ddb9k505u` (`notificaciones_id` ASC) VISIBLE,
  INDEX `FKc1xj698bie1016gcius8jqjcd` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `FKc1xj698bie1016gcius8jqjcd`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `AppServicioSaludData`.`usuarios` (`id`),
  CONSTRAINT `FKqbwyy4ujr0993864nnm17jch`
    FOREIGN KEY (`notificaciones_id`)
    REFERENCES `AppServicioSaludData`.`notificaciones` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `AppServicioSaludData`.`usuarios_permisos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AppServicioSaludData`.`usuarios_permisos` ;

CREATE TABLE IF NOT EXISTS `AppServicioSaludData`.`usuarios_permisos` (
  `usuario_id` VARCHAR(255) NOT NULL,
  `permiso_id` VARCHAR(255) NOT NULL,
  INDEX `FKk740drl0jtve48kyt88t4ee45` (`permiso_id` ASC) VISIBLE,
  INDEX `FKqdu02v93ycorup8mt9vmwivl8` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `FKk740drl0jtve48kyt88t4ee45`
    FOREIGN KEY (`permiso_id`)
    REFERENCES `AppServicioSaludData`.`permiso` (`id`),
  CONSTRAINT `FKqdu02v93ycorup8mt9vmwivl8`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `AppServicioSaludData`.`usuarios` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- 
-- DATOS
-- 
INSERT INTO `permiso` VALUES ('22f0bc4e-4535-4cdf-9ffb-7792e4508d6c','EDIT_TURN'),('475923c8-af7b-4688-acb4-4f118be3745e','ADD_ADMIN'),('48935df5-af42-441f-b289-8d377a750343','EDIT_PROFESIONAL'),('5c26fce0-c08b-472e-8c3a-46c27ff57298','EDIT_ADMIN'),('6fa2f43b-e23d-4e9c-bd22-93f2b1bf4be3','ADD_MEDIC'),('9855509a-fe1f-4026-9a58-e9268c6dde1d','DELETE_ADMIN'),('a7215358-180b-459b-80f1-029f3411cdb3','ADD_TURN'),('b8207bc6-e831-4b4c-b5fc-5c2a77d57e5e','DELETE_MEDIC'),('bc854feb-53b9-4027-ada9-a5d16edd9aab','DELETE_PROFESIONAL'),('be3d9766-c042-49a9-85d1-f88d94355d4c','DELETE_TURN'),('c7892efb-62b6-4dc0-8425-a3a85ba96c34','EDIT_PERMISIONS'),('fd2298b7-1f83-4f70-b3f8-5e367a9ce239','ADD_PROFESIONAL'),('fd3c6605-938e-4691-be94-70f67d994725','EDIT_MEDIC');

INSERT INTO `usuarios` VALUES ('paciente','0f25e88a-6904-42d6-80ee-bdc5f05c845d',0x01,'Ramiro','77777777','Ramiro@mail.com',NULL,'2023-11-10','Ramiro','$2a$10$BMFkx4pNBsgKQVM7/JSIJOuiMB7dVu7b23kHqKr8D4Zm6kpcRLo4a','PACIENTE','MASCULINO','123123','PARTICULAR',NULL,NULL,NULL,NULL,NULL),('Profesional','1bf677d4-b2fb-47e6-9321-fcc170487c03',0x01,'Gonzales','98723223','pediatrico@mail.com','2023-11-13','1995-01-04','Manuel','$2a$10$DJLsAUuoylxsof.w0ygJju9u.cNFic0.r6Ne3VAhYnoDpuTwkGwT.','MEDICO','MASCULINO','12312333323',NULL,NULL,'PEDIATRIA','0214125',NULL,NULL),('Profesional','2c497104-122c-4024-bc2d-e0966c854ac0',0x01,'Martinez','30123212','ginecologo@mail.com','2023-11-10','1990-11-13','Antonio','$2a$10$0GFK7kNVDGMuQGPgaF6zXenOsYgT3URxWOn3GCOy4FFKOUs8RDNb6','MEDICO','MASCULINO','5493132312131',NULL,NULL,'GINECOLOGIA','MP-122211',NULL,NULL),('Profesional','36569191-020b-42ff-abb8-6d5094203fce',0x01,'Puebla','24198321','cardiologa@mail.com','2023-11-10','1981-12-28','Adriana','$2a$10$x9UXthO7RpXGJ9/K.s2FeOgWEd7dWC5AAHOqY.POxm5b0nAQFiEqm','MEDICO','FEMENINO','549123123123',NULL,NULL,'CARDIOLOGIA','MP-122212',NULL,NULL),('paciente','50016107-10dd-44fb-984e-6e1557e64755',0x01,'Araceli','55555555','Araceli@mail.com',NULL,'2023-11-10','Araceli','$2a$10$GJ2kbywGvSK2PyXZbJszaO7vXnhIR53CrVLi2.yet2G3eYBYiMP4a','PACIENTE','FEMENINO','123123','PARTICULAR',NULL,NULL,NULL,NULL,NULL),('paciente','741640ef-cf18-40b4-a7ae-22cebba645cf',0x01,'Ayelen','22222222','Ayelen@mail.com',NULL,'2023-11-10','Ayelen','$2a$10$K4/oUuh28nV7tl6zpTuWJOfWT2wacB.yccU92OSVkf0FkkkE6oCDS','PACIENTE','FEMENINO','3333333','PARTICULAR',NULL,NULL,NULL,NULL,NULL),('Profesional','74f6e78f-ca6b-40a9-9f22-cacc05507a96',0x01,'De La Mancha','23000123','clinico@mail.com','2023-11-13','1973-01-01','Jose','$2a$10$BgXSYZpI8facWVtgLQ4osevwWWsfXkRpY6QtzMu1tyqueLZyNTxuS','MEDICO','MASCULINO','549123123321',NULL,NULL,'CLINICA','97887692',NULL,NULL),('paciente','76e2a037-fae5-4cd0-91ef-f88f7d8f5a4f',0x01,'Maria','33333333','Maria@mail.com',NULL,'2023-11-10','Maria','$2a$10$ECYFd20JptZ2Uj/vEkqwvOkAcFt35N/j.AGZAAz83oAFQfA4jm.V.','PACIENTE','FEMENINO','123123','PARTICULAR',NULL,NULL,NULL,NULL,NULL),('paciente','b1b02d72-7055-4fb2-9af7-b10de52c3de1',0x01,'Mauricio','11111111','mauricio1990arg@gmail.com',NULL,'2023-11-10','Mauricio','$2a$10$al.RSC2Oj6CV5tne1zRgJulhYQehmXIr3lnIP3.oEqpoNMBn9idDS','PACIENTE','MASCULINO','123123','PARTICULAR',NULL,NULL,NULL,NULL,NULL),('paciente','b654c639-d043-4582-a32a-7cd2f4181b59',0x01,'Leandro','88888888','Leandro@mail.com',NULL,'2023-11-10','Leandro','$2a$10$8HwUxjXrdgPrhncOayu43upVWM5f/CYTdXPUgCMCM1qLM69LxUBLG','PACIENTE','MASCULINO','123123','PARTICULAR',NULL,NULL,NULL,NULL,NULL),('Profesional','c034f906-a1a7-4030-b56a-a2f2c24df173',0x01,'Perez','32567890','cardiologo@mail.com','2023-11-13','1982-01-11','Marcos','$2a$10$HLdWZd7bCfQF8ncYCiKyJu90eNVGr1xZsOgfgTqkABajZ5xUkTME2','MEDICO','MASCULINO','5491231231',NULL,NULL,'CARDIOLOGIA','12311233',NULL,NULL),('Admin','c718af7a-8a73-49f4-b124-af22ed442dd8',0x01,'Ranger',NULL,'superadmin@admin.com',NULL,NULL,'Super ADMIN','$2a$10$73eOs0T9YveCDZ6K47cjRusj5c4fFyx5JXLJpi4M/8XHa0TFdP7Ta','ADMIN','MASCULINO',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Profesional','d1e24573-55e5-4868-aa7d-9fcc8a580de2',0x01,'Marcuzi','29123456','ginecologa@mail.com','2023-11-10','1983-05-01','Mariana','$2a$10$aFxwEhI8YA6FGVsyiY.5eezqLrmUs4pas4T1fIUXsQsy.6/Gfs2k2','MEDICO','FEMENINO','5493895434123',NULL,NULL,'GINECOLOGIA','MP-122215',NULL,NULL),('paciente','d3efc882-42d0-47f5-bef8-2c3776e5cc17',0x01,'Lucas','66666666','Lucas@mail.com',NULL,'2023-11-10','Lucas','$2a$10$.oqNPWa1MA9FP1cm2dbeTeRw00OGoa4AvcLeaRikcRi8MjIERIFKm','PACIENTE','MASCULINO','123123','PARTICULAR',NULL,NULL,NULL,NULL,NULL),('Profesional','d9faa363-0a3a-4bcf-b24c-7e8623766c7b',0x01,'vera','40323123','pediatra@mail.com','2023-11-10','2000-11-10','Selene','$2a$10$rEeTKNjN3Q41VVhu1/O3JuRWRHoNPFyp0aVI2MOxJD0IOtCJIEASa','MEDICO','FEMENINO','549123123',NULL,NULL,'PEDIATRIA','MP-122214',NULL,NULL),('paciente','e6ef2df1-0197-499b-b3af-ff80853b0893',0x01,'Antonio','44444444','antonio@mail.com',NULL,'2023-11-10','Antonio','$2a$10$1EUUSBxhnzmrP00O11SCruH0INSsY9bNxPeuKKymkJ8DX4JYg1Uxq','PACIENTE','MASCULINO','123123','PARTICULAR',NULL,NULL,NULL,NULL,NULL),('Profesional','f26f30d3-0bf9-43d9-a933-0de1046f6e24',0x01,'Peron','45454545','clinica@mail.com','2023-11-10','2014-11-10','Agustina','$2a$10$kOZDAmV2zrOBcsFtFrfhb.S7u05eTL0DJCwJjyIA87okOtyQIiudC','MEDICO','FEMENINO','45454545',NULL,NULL,'CLINICA','MP-122213',NULL,NULL);


INSERT INTO `usuarios_permisos` VALUES ('c718af7a-8a73-49f4-b124-af22ed442dd8','fd2298b7-1f83-4f70-b3f8-5e367a9ce239'),('c718af7a-8a73-49f4-b124-af22ed442dd8','48935df5-af42-441f-b289-8d377a750343'),('c718af7a-8a73-49f4-b124-af22ed442dd8','bc854feb-53b9-4027-ada9-a5d16edd9aab'),('c718af7a-8a73-49f4-b124-af22ed442dd8','a7215358-180b-459b-80f1-029f3411cdb3'),('c718af7a-8a73-49f4-b124-af22ed442dd8','22f0bc4e-4535-4cdf-9ffb-7792e4508d6c'),('c718af7a-8a73-49f4-b124-af22ed442dd8','be3d9766-c042-49a9-85d1-f88d94355d4c'),('c718af7a-8a73-49f4-b124-af22ed442dd8','6fa2f43b-e23d-4e9c-bd22-93f2b1bf4be3'),('c718af7a-8a73-49f4-b124-af22ed442dd8','fd3c6605-938e-4691-be94-70f67d994725'),('c718af7a-8a73-49f4-b124-af22ed442dd8','b8207bc6-e831-4b4c-b5fc-5c2a77d57e5e'),('c718af7a-8a73-49f4-b124-af22ed442dd8','475923c8-af7b-4688-acb4-4f118be3745e'),('c718af7a-8a73-49f4-b124-af22ed442dd8','5c26fce0-c08b-472e-8c3a-46c27ff57298'),('c718af7a-8a73-49f4-b124-af22ed442dd8','9855509a-fe1f-4026-9a58-e9268c6dde1d'),('c718af7a-8a73-49f4-b124-af22ed442dd8','c7892efb-62b6-4dc0-8425-a3a85ba96c34');
