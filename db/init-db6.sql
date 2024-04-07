CREATE DATABASE IF NOT EXISTS `cadastro`;

USE `cadastro`;

-- CREATE TABLE `cursos` (
--     `idcurso` INT(11) NOT NULL,
--     `nome` VARCHAR(30) NOT NULL,
--     `descricao` TEXT DEFAULT NULL,
--     `carga` INT(10) UNSIGNED DEFAULT NULL,
--     `totalaulas` INT(11) DEFAULT NULL,
--     `ano` YEAR(4) DEFAULT 2016,
--     PRIMARY KEY (`idcurso`),
--     UNIQUE KEY `nome` (`nome`)
-- );

INSERT INTO `cursos` VALUES
(1, 'HTML4', 'CURSOS DE HTML5', 40, 37, 2014),
(2, 'ALGORITMOS', 'LOGICA DE PROGRAMAÇÃO', 20, 15, 2014),
(3, 'PHOTOSHOP', 'DICAS DE PHOTOSHOP CC', 10, 8, 2014),
(4, 'PHP', 'CURSO DE PHP PARA INICIANTES', 40, 20, 2015),
(5, 'MYSQL', 'BANCO DE DADOS MYSQL', 30, 15, 2016),
(6, 'WORD', 'CURSO COMPLETO DE WORD', 40, 30, 2016),
(7, 'SAPATEADO', 'DANÇAS RÍTMICAS', 40, 30, 2018),
(8, 'COZINHA ÁRABE', 'APRENDA A FAZER KIBE', 40, 30, 2018),
(9, 'YOUTUBER', 'GERAR POLEMICA E GANHAR INSCRITOS', 5, 2, 2018);

-- CREATE TABLE `gafanhotos` (
--     `codigo` INT(11) DEFAULT NULL,
--     `id` INT(11) NOT NULL AUTO_INCREMENT,
--     `nome` VARCHAR(30) NOT NULL,
--     `prof` VARCHAR(20) DEFAULT NULL,
--     `nascimento` DATE DEFAULT NULL,
--     `sexo` ENUM ('M', 'F') DEFAULT NULL,
--     `peso` DECIMAL(5, 2) DEFAULT NULL,
--     `altura` DECIMAL(3, 2) DEFAULT NULL,
--     `nacionalidade` VARCHAR(20) DEFAULT 'Brasil',
--     PRIMARY KEY (`id`)
-- );

-- INSERT INTO `gafanhotos` VALUES
-- (NULL, 1, 'godofredo', NULL, '1999-08-01', 'M', 78.00, 1.00, 'Brasil'),
-- (NULL, 2, 'godofredo', NULL, '1999-08-01', 'M', 78.00, 1.00, 'Brasil'),
-- (NULL, 3, 'Godofredo', NULL, '1984-01-02', 'M', 78.00, 1.00, 'Brasil'),
-- (NULL, 4, 'Godofredo', NULL, '1984-01-02', 'M', 78.00, 1.00, 'Brasil'),
-- (NULL, 5, 'Godofredo', NULL, '1984-01-02', 'M', 78.00, 1.00, 'Brasil'),
-- (NULL, 6, 'Godofredo', NULL, '1984-01-02', 'M', 78.00, 1.00, 'Brasil'),
-- (NULL, 7, 'Godofredo', NULL, '1984-01-02', 'M', 78.00, 1.00, 'Brasil'),
-- (NULL, 8, 'Godofredo', NULL, '1984-01-02', 'M', 78.00, 1.00, 'Brasil'),
-- (NULL, 9, 'Godofredo', NULL, '1984-01-02', 'M', 78.00, 1.00, 'Brasil'),
-- (NULL, 10, 'Godofredo', NULL, '1984-01-02', 'M', 78.00, 1.00, 'Brasil'),
-- (NULL, 11, 'xodofredo', NULL, '1984-01-02', 'M', 78.00, 1.00, 'Brasil'),
-- (NULL, 12, 'uodofredo', NULL, '1984-01-02', 'M', 78.00, 1.00, 'Brasil'),
-- (NULL, 13, 'iodofredo', NULL, '1984-01-02', 'M', 78.00, 1.00, 'Brasil'),
-- (NULL, 14, 'G7odofredo', NULL, '1984-01-02', 'M', 78.50, 1.83, 'Brasil');