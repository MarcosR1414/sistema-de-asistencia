/* ESTE BASE DE DATOS SE IMPORTA EN EL SQL DE XAMPP, CREANDO UN BD LLAMADA ASISTENCIA*/



/* YA QUE ESTE ERA ORIGINALMENTE HECHO PARA MARIABD CAMBIE EL ORDEN Y ALGUNAS COSAS PARA QUE SE PUEDA TRABAJAR EN XAMPPP*/
DROP TABLE IF EXISTS `asistencias`;

/* SEXTO IMPORTAR ASISTENCIAS*/
CREATE TABLE `asistencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ingreso` datetime NOT NULL,
  `salida` datetime DEFAULT NULL,
  `fecha` date NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `estado` enum('1','2','3','4') COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`),
  CONSTRAINT `asistencias_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;


LOCK TABLES `asistencias` WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS `carreras`;

/* SEGUNDO IMPORTAR CARRERAS*/
CREATE TABLE `carreras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;


LOCK TABLES `carreras` WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS `configuracion`;

/* TERCERO IMPORTAR CONFIGURACION CON SUS DATOS DE INSER INTO*/
CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

LOCK TABLES `configuracion` WRITE;

INSERT INTO `configuracion` VALUES (1,'SISTEMA SENATI','90000000','Senati@gmail.com','Huánuco - PERÚ');

UNLOCK TABLES;



DROP TABLE IF EXISTS `estudiantes`;


/* QUINTO  IMPORTAR ESTUDIANTES*/
CREATE TABLE `estudiantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_carrera` int(11) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_carrera` (`id_carrera`),
  KEY `id_nivel` (`id_nivel`),
  CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `estudiantes_ibfk_2` FOREIGN KEY (`id_nivel`) REFERENCES `niveles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

LOCK TABLES `estudiantes` WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS `niveles`;


/* PRIMERO IMPORTAR NIVELES*/
CREATE TABLE `niveles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '',
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOCK TABLES `niveles` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `usuario`;


/* CUARTO IMPORTAR USUARIO CON SU INSERT INTO*/
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `perfil` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

LOCK TABLES `usuario` WRITE;

INSERT INTO `usuario` VALUES (1,'SISTEMA SENATI','Senati@gmail.com','$2y$10$VWAkY6.6U3RLfGKLTCVQv.GXNyXMVcXoDOn5BboKDvIRIa5En4QAK','Institucion','',1),(2,'Marcos','Marcos1@gmail.com','$2y$10$fSc7hlUVkqcGCR.9iLw6eeMnuy9Nz50Wf3C13yJtqrb2RUviQtrqK','Casa',NULL,1);

UNLOCK TABLES;

