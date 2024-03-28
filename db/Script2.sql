CREATE DATABASE IF NOT EXISTS Campeonato;

use Campeonato;
CREATE TABLE IF NOT EXISTS Equipa (
    id_equipa   INTEGER,
    nome        VARCHAR(40) NOT NULL,
    cidade      VARCHAR(30) NOT NULL,
    diretor     VARCHAR(40) NOT NULL,
    CONSTRAINT pk_equipa_id_equipa PRIMARY KEY (id_equipa)
);

CREATE TABLE IF NOT EXISTS Treinador (
    id_treinador INTEGER,
    nome         VARCHAR(40) NOT NULL,
    idade        INTEGER,
    telefone     VARCHAR(15) NOT NULL,
    CONSTRAINT pk_treinador_id_treinador PRIMARY KEY (id_treinador)
);


CREATE TABLE IF NOT EXISTS Bola (
    referencia  VARCHAR(10),
    id_equipa   INTEGER,
    fabricante  VARCHAR(40) NOT NULL,
    CONSTRAINT pk_bola_referencia_id_equipa PRIMARY KEY (id_equipa, referencia),
    CONSTRAINT fk_bola_id_equipa FOREIGN KEY (id_equipa) REFERENCES Equipa(id_equipa)
);

CREATE TABLE IF NOT EXISTS Experiencia (
    id_equipa       INTEGER,     
    id_treinador    INTEGER,     
    escalao         VARCHAR(40),
    anos            INTEGER,
    CONSTRAINT pk_experien_id_equip_trein_tip PRIMARY KEY (id_equipa, id_treinador, escalao),
	CONSTRAINT fk_experiencia_id_equipa    FOREIGN KEY (id_equipa) REFERENCES Equipa(id_equipa),
	CONSTRAINT fk_experiencia_id_treinador FOREIGN KEY (id_treinador) REFERENCES Treinador(id_treinador)
);

INSERT INTO Treinador VALUES(1, 'António', 34, 922424561),
							(2, 'Barbosa', 45, 965552936),
							(3, 'Tavares', 48, 933332267),
							(4, 'Joaquim', 57, 918638465),
							(5, 'Alberto', 33, 966785309),
							(6, 'Duarte', 54, 912773446);

INSERT INTO Equipa VALUES(12, 'Académico', 'Porto', 'Mário'),
							(15, 'Universitário', 'Coimbra', 'João'),
							(20, 'Juventude', 'Braga', 'Silva'),
							(24, 'Tigres', 'Espinho', 'Cardoso');


INSERT INTO Bola VALUES(1, 12, 'Adidas'),
						(9, 12, 'Reebok'),
						(13, 12, 'Adidas'),
						(1, 15, 'Adidas'),
						(3, 20, 'Olimpic'),
						(4, 20, 'Nike'),
						(18, 24, 'Reebok'),
						(21, 24, 'Olimpic');

INSERT INTO Experiencia VALUES(12, 1, 'juniores', 10),
								(12, 1, 'seniores', 5),
								(12, 2, 'iniciados', 2),
								(12, 2, 'juniores', 3),
								(12, 2, 'juvenis', 4),
								(15, 3, 'juniores', 15),
								(24, 5, 'juvenis', 12);
								
