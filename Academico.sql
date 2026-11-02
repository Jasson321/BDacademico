-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.20.0.7320
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para academico
CREATE DATABASE IF NOT EXISTS `academico` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `academico`;

-- Volcando estructura para tabla academico.corso
CREATE TABLE IF NOT EXISTS `corso` (
  `cur_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cur_nombre` varchar(100) NOT NULL,
  `cur_docente` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`cur_id`),
  KEY `Fk_curso_docente` (`cur_docente`),
  CONSTRAINT `Fk_curso_docente` FOREIGN KEY (`cur_docente`) REFERENCES `dosente` (`doc_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla academico.dosente
CREATE TABLE IF NOT EXISTS `dosente` (
  `doc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `doc_apellidos` varchar(100) NOT NULL DEFAULT '0',
  `doc_nombres` varchar(50) NOT NULL DEFAULT '',
  `doc_especialidad` varchar(100) DEFAULT '',
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla academico.escuela
CREATE TABLE IF NOT EXISTS `escuela` (
  `esc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `esc_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`esc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla academico.estudiante
CREATE TABLE IF NOT EXISTS `estudiante` (
  `est_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `est_apellidos` varchar(100) NOT NULL,
  `est_nombres` varchar(50) NOT NULL,
  `est_fecha_nac` date DEFAULT NULL,
  `est_escuela` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`est_id`),
  KEY `FK_escuela` (`est_escuela`),
  CONSTRAINT `FK_escuela` FOREIGN KEY (`est_escuela`) REFERENCES `escuela` (`esc_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla academico.evaluasion
CREATE TABLE IF NOT EXISTS `evaluasion` (
  `eva_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eva_curso` int(10) unsigned NOT NULL,
  `eva_estudiante` int(10) unsigned NOT NULL,
  `eva_promedio` decimal(4,2) unsigned NOT NULL,
  PRIMARY KEY (`eva_id`),
  KEY `FK1_corso` (`eva_curso`),
  KEY `FK2_etudiante` (`eva_estudiante`),
  CONSTRAINT `FK1_corso` FOREIGN KEY (`eva_curso`) REFERENCES `corso` (`cur_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK2_etudiante` FOREIGN KEY (`eva_estudiante`) REFERENCES `estudiante` (`est_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
