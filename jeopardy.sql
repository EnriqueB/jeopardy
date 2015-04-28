-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 23, 2014 at 08:10 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jeopardy`
--

-- --------------------------------------------------------

--
-- Table structure for table `preguntas`
--

CREATE TABLE IF NOT EXISTS `preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tema` varchar(30) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `pista` varchar(400) NOT NULL,
  `respuesta` varchar(40) NOT NULL,
  `puntuacion` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `preguntas`
--

(3, 'Matematicas', 'Aritmetica', 'Sumatoria de los numeros del 1 al 5', '15', 100),
(4, 'Matematicas', 'Aritmetica', 'El cuadrado de la diferencia entre 13 y 4', '81', 200),
(5, 'Matematicas', 'Aritmetica', 'Cual es la mitad de 2^6', '32', 300),
(6, 'Matematicas', 'Aritmetica', 'Cuanto es la sumatoria de los primeros 5 cuadrados perfectos.', '55', 400),
(7, 'Matematicas', 'Aritmetica', 'Cuantos digitos tiene 2^1998 multiplicado por 5^2000', '2000', 500),
(8, 'Matematicas', 'Combinatoria', 'Si tengo 2 camisas y 3 pantalones, cuantos atuendos diferentes puedo usar', '6', 100),
(9, 'Matematicas', 'Combinatoria', 'De cuantas formas se pueden acomodar a 4 personas en 4 sillas numeradas', '24', 200),
(10, 'Matematicas', 'Combinatoria', 'En un grupo de 5 personas, cuantos equipos diferentes de 3 personas se pueden formar', '10', 300),
(11, 'Matematicas', 'Combinatoria', 'En un salon de 4 ninos y 6 ninas cuantos equipos diferentes pueden elegirse con 2 ninos y 3 ninas', '120', 400),
(12,'Matematicas', 'Combinatoria', 'De un grupo de 6 personas, de cuantas formas diferentes se pueden distribuir en 3 equipos de 2', '15', 500),
(13, 'Matematicas', 'Teoria de numeros', 'En cuantos digitos diferentes puede terminar un multiplo de 5', '2', 100),
(14, 'Matematicas', 'Teoria de numeros', 'Cantidad de enteros positivos menores a 100 divisibles entre 3', '33', 200),
(15, 'Matematicas', 'Teoria de numeros', 'Maximo comun divisor de 51 y 68', '17', 300),
(16, 'Matematicas', 'Teoria de numeros', 'Minimo comun multiple de 12 y 16', '48', 400),
(17, 'Matematicas', 'Teoria de numeros', 'Cantidad de factores de 60', '12', 500),
(18, 'Geografia', 'Montanas', 'Montana mas alta del mundo', 'Everest', 100),
(19, 'Geografia', 'Montanas', 'Cual es la cordillera más larga', 'Andes', 200),
(20, 'Geografia', 'Montanas', 'Por cuantos paises pasan los alpes', '8', 300),
(21, 'Geografia', 'Montanas', 'Cual fue el volcán que destruyo Pompeii en el ano 79 AD', 'Monte Vesubio', 400),
(22, 'Geografia', 'Montanas', 'Cuantos metros sobre el nivel del mar se encuentra el Everest', '8848', 500),
(23, 'Geografia', 'Rios', 'Rio mas largo del mundo', 'Nilo', 100),
(24, 'Geografia', 'Rios', 'Rio mas ancho del mundo', 'Amazonas', 200),
(25, 'Geografia', 'Rios', 'Tercer rio mas largo del mundo', 'Yangtze', 300),
(26, 'Geografia', 'Rios', 'En que país está el rio Lena', 'Rusia', 400),
(27, 'Geografia', 'Rios', 'Longitud en kilometros del rio nilo', '6853', 500),
(28, 'Geografia', 'Lagos', 'Lago mas grande en area del mundo', 'Mar Caspio', 100),
(29, 'Geografia', 'Lagos', 'Lago mas profundo del mundo', 'Lago Baikal', 200),
(30, 'Geografia', 'Lagos', 'Pais donde residiría el monstruo del Lago Ness, de existir', 'Escocia', 300),
(1, 'Geografia', 'Lagos', 'Lago mas grande en area de Mexico', 'Lago de Chapala', 400),
(2, 'Geografia', 'Lagos', 'Area superficial en kilometros cuadrados, del Mar Caspio', '371000', 500),
(31, 'Fisica', 'Electricidad y Magnetismo', 'Fisico que formulo la teoria de la relatividad', 'Albert Einstein', 100),
(32, 'Fisica', 'Electricidad y Magnetismo', 'Particula elemental hipotetica constituida por un solo polo magnetico', 'Monopolo Magnetico', 200),
(33, 'Fisica', 'Electricidad y Magnetismo', 'Unidad del Sistem Internacional en la que se mide un campo magnetico', 'Tesla', 300),
(34, 'Fisica', 'Electricidad y Magnetismo', 'Capacidad que tiene un campo eléctrico de realizar trabajo', 'Potencial electrico', 400),
(35, 'Fisica', 'Electricidad y Magnetismo', 'Unidad para medir el flujo magnetico', 'Weber', 500),
(36, 'Fisica', 'Cinematica', 'La fuerza es igual a la masa multiplicada por la', 'Aceleracion', 100),
(37, 'Fisica', 'Cinematica', 'La velocidad de rotación es también conocida como la velocidad..', 'Angular', 200),
(38, 'Fisica', 'Cinematica', 'Magnitud relacionada con el cambio de direccion de la velocidad cuando se recorre una trayectoria curvilinea', 'Aceleracion Centripeta', 300),
(39, 'Fisica', 'Cinematica', 'Fuerza ficticia que aparece cuando se describe el movimiento de un cuerpo en un sistema de referencia en rotación', 'Fuerza centrigufa', 400),
(40, 'Fisica', 'Cinematica', 'Medida de la variación máxima del desplazamiento de un movimiento ooscilatorio', 'amplitud', 500),
(41, 'Historia', 'Guerras', 'Cantidad oficial de guerras mundiales', '2', 100),
(42, 'Historia', 'Guerras', 'Ano en que termina la segunda guerra mundial', '1945', 200),
(43, 'Historia', 'Guerras', 'Duración en anos de la guerra de los 100 anos', '116', 300),
(44, 'Historia', 'Guerras', 'Quien dirigía las tropas británicas en contra de Napoleon en la batalla de Waterloo', 'Duque de Wellington', 400),
(45, 'Historia', 'Guerras', 'Ano en que se llevo a cabo la batalla de Lyngor', '1812', 500),
(46, 'Historia', 'Presidentes de Mexico', 'Presidente de méxico para el periodo 2000-2006', 'Vicente Fox', 100),
(47, 'Historia', 'Presidentes de Mexico', 'Primer presidente de Mexico', 'Guadalupe Victoria', 200),
(48, 'Historia', 'Presidentes de Mexico', 'Presidente de méxico para el periodo 1982-1988', 'Miguel de la Madrid', 300),
(49, 'Historia', 'Presidentes de Mexico', 'Cuantos presidentes diferentes ha tenido Mexico', '62', 400),
(50, 'Historia', 'Presidentes de Mexico', 'Ano en que fue presidente Felix María Zuloaga', '1858', 500),
(51, 'Quimica', 'Elementos', 'Letra con la que aparece el primer elemento en la tabla periodica', 'H', 100),
(52, 'Quimica', 'Elementos', 'Numero de elementos en la tabla periodica', '118', 200),
(53, 'Quimica', 'Elementos', 'De que color es el oxigeno en su forma solida', 'Azul', 300),
(54, 'Quimica', 'Elementos', 'Unica letra que no aparece en la tabla periodica', 'J', 400),
(55, 'Quimica', 'Elementos', 'Cual es el numero atomico del tantalio', '73', 500),
(56, 'Quimica', 'Compuestos', 'Sustancia representada por el compuesto H2O', 'Agua', 100),
(57, 'Quimica', 'Compuestos', 'Formula para el compuesto quimico de la sal de mesa', 'NaCl', 200),
(58, 'Quimica', 'Compuestos', 'Compuestos formados por un metal y oxígeno', 'Oxidos Basicos', 300),
(59, 'Quimica', 'Compuestos', 'Macromoleculas formadas por la union de moleculas mas pequenas llamadas monomeros', 'polimeros', 400),
(60, 'Quimica', 'Compuestos', 'Compuestos formados por la reaccion de un oxacido y un hidroxido, como por ejemplo el hipoclorito de sodio', 'Oxisales', 500),
(61, 'Biologia', 'Taxonomia', 'Cantidad de reinos de la naturaleza', '5', 100),
(62, 'Biologia', 'Taxonomia', 'Llamado el padre de la taxonomia', ' Carolus Linnaeus', 200),
(63, 'Biologia', 'Taxonomia', 'Cuantos rangos existen en la taxonomia', '8', 300),
(64, 'Biologia', 'Taxonomia', 'Cual es la clasificacion mas especifica en la taxonomia', 'Especie', 400),
(65, 'Biologia', 'Taxonomia', 'Contiene a todos aquellos organismos eucariontes que no pueden clasificarse dentro de Fungi, Animalia o Plantae', 'Protista', 500),
(66, 'Biologia', 'Celulas', 'Organulos celulares que en los organismos eucariontes fotosintetizadores se ocupan de la fotosíntesis', 'Cloroplastos', 100),
(67, 'Biologia', 'Celulas', 'Bicapa lipidica que delimita todas las celulas', 'Membrana plasmática', 200),
(68, 'Biologia', 'Celulas', 'Organulos propios de la celula vegetal, que almacenan los pigmentos a los que se deben los colores', 'Cromoplastos', 300),
(69, 'Biologia', 'Celulas', 'Complejo molecular encargado de sintetizar proteinas', 'Ribosomas', 400),
(70, 'Biologia', 'Celulas', 'Expansion de las siglas RER referente al organulo encargado de la sintesis y transporte de proteinas', 'Reticulo endoplasmatico rugoso', 500);


-- --------------------------------------------------------

--
-- Table structure for table `temas`
--

CREATE TABLE IF NOT EXISTS `temas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tema` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `temas`
--

INSERT INTO `temas` (`id`, `tema`) VALUES
(10, 'Quimica'),
(9, 'Historia'),
(8, 'Fisica'),
(7, 'Geografia'),
(6, 'Matematicas'),
(11, 'Biologia');

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tema` varchar(30) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `tema`, `categoria`) VALUES
(6, 'Matematicas', 'Combinatoria'),
(5, 'Matematicas', 'Aritmetica'),
(7, 'Matematicas', 'Teoria de numeros'),
(8, 'Geografia', 'Montanas'),
(9, 'Geografia', 'Rios'),
(10, 'Geografia', 'Lagos'),
(11, 'Fisica', 'Cinematica'),
(12, 'Fisica', 'Electricidad y Magnetismo'),
(13, 'Historia', 'Guerras'),
(14, 'Historia', 'Presidentes de Mexico'),
(15, 'Quimica', 'Elementos'),
(16, 'Quimica', 'Compuestos'),
(17, 'Biologia', 'Taxonomia'),
(18, 'Biologia', 'Celulas');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`) VALUES
(1, 'juan', 'juan');

-- --------------------------------------------------------

--
-- Table structure for table `jugadores`
--

CREATE TABLE IF NOT EXISTS `jugadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `puntuacion` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jugadores`
--

INSERT INTO `jugadores` (`id`, `nombre`, `puntuacion`) VALUES
(1, 'Pedro', 200),
(2, 'Felipe', 500),
(3, 'Maria', 700),
(4, 'Jaime', 0);

ALTER TABLE `usuarios` ADD `cambioPass` INT(11) NOT NULL DEFAULT '0' ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

