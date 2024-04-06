
CREATE DATABASE Campeonato_1;

USE Campeonato_1;

--criar tabelas

CREATE TABLE Equipa (
    id_equipa INTEGER PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    diretor VARCHAR(40) NOT NULL
);

CREATE TABLE Treinador (
    id_treinador INTEGER PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    idade INTEGER,
    telefone VARCHAR(15) NOT NULL
);

CREATE TABLE Bola (
    referencia VARCHAR(10),
    id_equipa INTEGER,
    fabricante VARCHAR(40),
    PRIMARY KEY (id_equipa, referencia),
    FOREIGN KEY (id_equipa) REFERENCES Equipa (id_equipa)
);

CREATE TABLE Experiencia (
    id_equipa INTEGER,
    id_treinador INTEGER,
    escalao VARCHAR(40),
    anos INTEGER,
    PRIMARY KEY (id_equipa, id_treinador, escalao),
    FOREIGN KEY (id_equipa) REFERENCES Equipa (id_equipa),
    FOREIGN KEY (id_treinador) REFERENCES Treinador (id_treinador)
);

-- Preencher tabelas
INSERT INTO Treinador VALUES
    (1, 'António', 34, '922424561'),
    (2, 'Barbosa', 45, '965552936'),
    (3, 'Tavares', 48, '933332267'),
    (4, 'Joaquim', 57, '918638465'),
    (5, 'Alberto', 33, '966785309'),
    (6, 'Duarte', 54, '912773446');

INSERT INTO Equipa VALUES
    (12, 'Académico', 'Porto', 'Mário'),
    (15, 'Universitário', 'Coimbra', 'João'),
    (20, 'Juventude', 'Braga', 'Silva'),
    (24, 'Tigres', 'Espinho', 'Cardoso');

INSERT INTO Bola VALUES
    ('1', 12, 'Adidas'),
    ('9', 12, 'Reebok'),
    ('13', 12, 'Adidas'),
    ('1', 15, 'Adidas'),
    ('3', 20, 'Olimpic'),
    ('4', 20, 'Nike'),
    ('18', 24, 'Reebok'),
    ('21', 24, 'Olimpic');

INSERT INTO Experiencia VALUES
    (12, 1, 'juniores', 10),
    (12, 1, 'seniores', 5),
    (12, 2, 'iniciados', 2),
    (12, 2, 'juniores', 3),
    (12, 2, 'juvenis', 4),
    (15, 3, 'juniores', 15),
    (24, 5, 'juvenis', 12);