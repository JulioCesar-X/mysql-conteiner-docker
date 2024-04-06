create database Empresa;

use Empresa;

CREATE TABLE
    Cliente (
        ClienteID INT PRIMARY KEY,
        Nome VARCHAR(100),
        Email VARCHAR(100),
        Telefone VARCHAR(20),
        Endereco VARCHAR(255)
    );

CREATE TABLE
    CategoriaProduto (CategoriaID INT PRIMARY KEY, Nome VARCHAR(100));

CREATE TABLE
    Produto (
        ProdutoID INT PRIMARY KEY,
        Nome VARCHAR(100),
        Preco DECIMAL(10, 2),
        Stock INT,
        CategoriaID INT references CategoriaProduto (CategoriaID)
    );

CREATE TABLE
    CanalVenda (CanalID INT PRIMARY KEY, Nome VARCHAR(100));

-- Criação da tabela Fatura
CREATE TABLE
    Fatura (
        FaturaID INT PRIMARY KEY,
        ClienteID INT,
        Data DATE,
        ValorTotal DECIMAL(10, 2),
        CanalID INT,
        FOREIGN KEY (CanalID) references CanalVenda (CanalID),
        FOREIGN KEY (ClienteID) REFERENCES Cliente (ClienteID)
    );

-- Criação da tabela Linhas de Fatura
CREATE TABLE
    LinhasDeFatura (
        LinhaID INT PRIMARY KEY,
        FaturaID INT,
        ProdutoID INT,
        Quantidade INT,
        PrecoUnitario DECIMAL(10, 2),
        Total DECIMAL(10, 2),
        FOREIGN KEY (FaturaID) REFERENCES Fatura (FaturaID),
        FOREIGN KEY (ProdutoID) REFERENCES Produto (ProdutoID)
    );

INSERT INTO
    Cliente (ClienteID, Nome, Email, Telefone, Endereco)
VALUES
    (
        1,
        'Maria Silva',
        'maria@email.com',
        '123456789',
        'Rua A, 123'
    ),
    (
        2,
        'João Santos',
        'joao@email.com',
        '987654321',
        'Rua B, 456'
    ),
    (
        3,
        'Ana Oliveira',
        'ana@email.com',
        '111222333',
        'Rua C, 789'
    );

-- Instruções de inserção para a tabela Produto
INSERT INTO
    Produto (ProdutoID, Nome, Preco, Stock)
VALUES
    (1, 'Celular', 1000.00, 50),
    (2, 'TV', 1500.00, 30),
    (3, 'Notebook', 2000.00, 20),
    (4, 'Fone de Ouvido', 100.00, 100);

-- Instruções de inserção para a tabela CategoriaProduto
INSERT INTO
    CategoriaProduto (CategoriaID, Nome)
VALUES
    (1, 'Eletrônicos'),
    (2, 'Acessórios');

-- Instruções de inserção para a tabela CanalVenda
INSERT INTO
    CanalVenda (CanalID, Nome)
VALUES
    (1, 'Loja Física'),
    (2, 'Loja Online');

-- Instruções de inserção para a tabela Fatura
INSERT INTO
    Fatura (FaturaID, ClienteID, Data, ValorTotal)
VALUES
    (1, 1, '2024-03-01', 1000.00),
    (2, 2, '2024-03-02', 1500.00),
    (3, 3, '2024-03-03', 2000.00);

-- Instruções de inserção para a tabela LinhasDeFatura
INSERT INTO
    LinhasDeFatura (
        LinhaID,
        FaturaID,
        ProdutoID,
        Quantidade,
        PrecoUnitario,
        Total
    )
VALUES
    (1, 1, 1, 1, 1000.00, 1000.00),
    (2, 2, 2, 1, 1500.00, 1500.00),
    (3, 3, 3, 1, 2000.00, 2000.00),
    (4, 1, 4, 2, 100.00, 200.00);

-- Instruções de inserção para simular compras de diferentes clientes
INSERT INTO
    Fatura (FaturaID, ClienteID, Data, ValorTotal)
VALUES
    (4, 2, '2024-03-04', 250.00),
    (5, 3, '2024-03-05', 300.00);

INSERT INTO
    LinhasDeFatura (
        LinhaID,
        FaturaID,
        ProdutoID,
        Quantidade,
        PrecoUnitario,
        Total
    )
VALUES
    (5, 4, 4, 5, 100.00, 500.00),
    (6, 5, 1, 1, 1000.00, 1000.00),
    (7, 5, 2, 1, 1500.00, 1500.00);