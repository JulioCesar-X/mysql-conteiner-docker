-- create database pp_5410;

use pp_5410;

-- CREATE TABLE
--     funcionarios (
--         id INT PRIMARY KEY,
--         nome_funcionario VARCHAR(50) NOT NULL,
--         departamento VARCHAR(50) NOT NULL
--     );

-- CREATE TABLE
--     automoveis (
--         matricula VARCHAR(20) PRIMARY KEY,
--         marca VARCHAR(50) NOT NULL,
--         modelo VARCHAR(50) NOT NULL,
--         id_funcionario INT,
--         FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id)
--     );

-- CREATE TABLE
--     viagens (
--         id_viagem INT PRIMARY KEY,
--         matricula VARCHAR(20),
--         id_funcionario INT,
--         km_percorridos FLOAT,
--         combustivel_consumido FLOAT,
--         FOREIGN KEY (matricula) REFERENCES automoveis (matricula),
--         FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id)
--     );

INSERT INTO
    funcionarios (id, nome_funcionario, departamento)
VALUES
    (1, 'João', 'Vendas'),
    (2, 'Maria', 'Vendas'),
    (3, 'Pedro', 'Logística'),
    (4, 'Ana', 'Recursos Humanos');

INSERT INTO
    automoveis (matricula, marca, modelo, id_funcionario)
VALUES
    ('ABC123', 'Marca1', 'Modelo1', 1),
    ('DEF456', 'Marca2', 'Modelo2', 2),
    ('GHI789', 'Marca3', 'Modelo3', 3),
    ('JKL012', 'Marca1', 'Modelo4', 4),
    ('MNO345', 'Marca2', 'Modelo5', 1),
    ('PQR678', 'Marca3', 'Modelo6', 2);

INSERT INTO
    viagens (
        id_viagem,
        matricula,
        id_funcionario,
        km_percorridos,
        combustivel_consumido
    )
VALUES
    (1, 'ABC123', 1, 100, 10),
    (2, 'DEF456', 2, 200, 15),
    (3, 'GHI789', 3, 150, 12),
    (4, 'JKL012', 4, 80, 8),
    (5, 'MNO345', 1, 120, 10),
    (6, 'PQR678', 2, 180, 14);