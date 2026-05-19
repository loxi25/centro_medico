-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 27-04-2026 a las 22:32:47
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: if0_41717204_centro_medico
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla Cita
--

CREATE TABLE Cita (
  id_cita int(11) NOT NULL,
  fecha_cita date NOT NULL,
  hora_cita time NOT NULL,
  id_paciente int(11) NOT NULL,
  id_medico int(11) NOT NULL,
  id_consultorio int(11) NOT NULL,
  estado_cita enum('Asignada','Atendida') DEFAULT 'Asignada',
  observaciones_cita text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla Consultorio
--

CREATE TABLE Consultorio (
  id_consultorio int(11) NOT NULL,
  nombre_consultorio char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla Consultorio
--

INSERT INTO Consultorio (id_consultorio, nombre_consultorio) VALUES
(1, 'Módulo Titanio'),
(2, 'Módulo Carbono'),
(3, 'Sala de Trauma'),
(4, 'Unidad Isótopo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla Medico
--

CREATE TABLE Medico (
  id_medico int(11) NOT NULL,
  identificacion_medico char(15) NOT NULL,
  nombre_medico varchar(50) NOT NULL,
  apellidos_medico varchar(50) NOT NULL,
  especialidad_medico varchar(50) DEFAULT NULL,
  telefono_medico char(15) DEFAULT NULL,
  correo_medico varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla Medico
--

INSERT INTO Medico (id_medico, identificacion_medico, nombre_medico, apellidos_medico, especialidad_medico, telefono_medico, correo_medico) VALUES
(1, '1098765432', 'Samyr Alejandro', 'Archila Güiza', 'Cirugía de Trauma', '3157829012', 'samyr.archila@gda.com'),
(2, '1102345678', 'Juan Pablo', 'Duran Santos', 'Neurocirugía', '3204567890', 'skaute67r@gda.com'),
(3, '1095123456', 'David Santiago', 'Macias Maldonado', 'Psiquiatría', '3001234567', 'david.macias@gda.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla Paciente
--

CREATE TABLE Paciente (
  id_paciente int(11) NOT NULL,
  identificacion_paciente char(15) NOT NULL,
  nombre_paciente varchar(50) NOT NULL,
  apellidos_paciente varchar(50) NOT NULL,
  fecha_nac_paciente date DEFAULT NULL,
  sexo_paciente enum('Femenino','Masculino','Otro') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla Paciente
--

INSERT INTO Paciente (id_paciente, identificacion_paciente, nombre_paciente, apellidos_paciente, fecha_nac_paciente, sexo_paciente) VALUES
(1, '1005678123', 'Sorteh Jhull Jade', 'Florez Peñaloza', '2010-05-03', 'Femenino'),
(2, '1010234591', 'Oscar Eduardo', 'Sanchez Payares', '2008-09-08', 'Masculino'),
(3, '1090456789', 'Sara Isabella', 'Piza Moncada', '2010-05-24', 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla Usuario
--

CREATE TABLE Usuario (
  id_usuario int(11) NOT NULL,
  login_usuario char(15) NOT NULL,
  password_usuario varchar(60) NOT NULL,
  estado_usuario enum('Activo','Inactivo') NOT NULL,
  tipo_usuario enum('Administrador','Asistente','Medico','Paciente') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla Usuario
--

INSERT INTO Usuario (id_usuario, login_usuario, password_usuario, estado_usuario, tipo_usuario) VALUES
(1, 'acastillo', '12345678', 'Activo', 'Administrador');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla Cita
--
ALTER TABLE Cita
  ADD PRIMARY KEY (id_cita),
  ADD KEY fk_paciente (id_paciente),
  ADD KEY fk_medico (id_medico),
  ADD KEY fk_consultorio (id_consultorio);

--
-- Indices de la tabla Consultorio
--
ALTER TABLE Consultorio
  ADD PRIMARY KEY (id_consultorio);

--
-- Indices de la tabla Medico
--
ALTER TABLE Medico
  ADD PRIMARY KEY (id_medico),
  ADD UNIQUE KEY identificacion_medico (identificacion_medico);

--
-- Indices de la tabla Paciente
--
ALTER TABLE Paciente
  ADD PRIMARY KEY (id_paciente),
  ADD UNIQUE KEY identificacion_paciente (identificacion_paciente);

--
-- Indices de la tabla Usuario
--
ALTER TABLE Usuario
  ADD PRIMARY KEY (id_usuario),
  ADD UNIQUE KEY login_usuario (login_usuario);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla Cita
--
ALTER TABLE Cita
  MODIFY id_cita int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla Consultorio
--
ALTER TABLE Consultorio
  MODIFY id_consultorio int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla Medico
--
ALTER TABLE Medico
  MODIFY id_medico int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla Paciente
--
ALTER TABLE Paciente
  MODIFY id_paciente int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla Usuario
--
ALTER TABLE Usuario
  MODIFY id_usuario int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla Cita
--
ALTER TABLE Cita
  ADD CONSTRAINT fk_consultorio FOREIGN KEY (id_consultorio) REFERENCES Consultorio (id_consultorio),
  ADD CONSTRAINT fk_medico FOREIGN KEY (id_medico) REFERENCES Medico (id_medico),
  ADD CONSTRAINT fk_paciente FOREIGN KEY (id_paciente) REFERENCES Paciente (id_paciente);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;