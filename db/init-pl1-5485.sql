-- Criar a base de dados Projetos
CREATE DATABASE Projetos;

-- Criar as tabelas
USE Projetos;

CREATE    TABLE Departamento (
          DepNum INT IDENTITY (1, 1) PRIMARY KEY,
          Nome VARCHAR(50) NOT NULL,
          LOCAL VARCHAR(50) NOT NULL
          );

CREATE    TABLE Empregado (
          EmpNum INT IDENTITY (1, 1) PRIMARY KEY,
          Nome VARCHAR(50) NOT NULL,
          Categoria VARCHAR(50) NOT NULL,
          Salário MONEY,
          DepNum INT,
          DataAniversario DATE NOT NULL DEFAULT '1900-01-01',
          FOREIGN KEY (DepNum) REFERENCES Departamento (DepNum)
          );

CREATE    TABLE Projeto (
          ProjNum INT IDENTITY (1, 1) PRIMARY KEY,
          Designacao VARCHAR(100) NOT NULL,
          Fundos MONEY
          );

CREATE    TABLE Atribuicao (
          ProjNum INT,
          EmpNum INT,
          Funcao VARCHAR(50) NOT NULL,
          DataAtribuicao DATE DEFAULT GETDATE (),
          FOREIGN KEY (ProjNum) REFERENCES Projeto (ProjNum),
          FOREIGN KEY (EmpNum) REFERENCES Empregado (EmpNum)
          );

-- Inserir dados na tabela Departamento
INSERT    INTO Departamento (Nome, LOCAL)
VALUES    ('Logística', 'Francelos'),
          ('Mecânica', 'Gondomar'),
          ('Recursos Humanos', 'Porto'),
          ('Inovação e Tecnologias', 'Maia'),
          ('Vendas', 'Porto');

-- Inserir dados na tabela Empregado
INSERT    INTO Empregado (Nome, Categoria, Salário, DepNum)
VALUES    (
          'António Jorge Trindade',
          'Engenheiro Mecânico',
          2000.00,
          2
          ),
          ('Ana Luísa Freitas Bastos', 'Gestora', 1650.00, 3),
          (
          'Filipe Lencastre Amaral',
          'Sociólogo',
          1650.00,
          3
          ),
          (
          'André Maia da Luz',
          'Diretor Comercial',
          2000.00,
          5
          ),
          (
          'Francisco Vieira dos Santos',
          'Gestor',
          1250.00,
          1
          );

-- Inserir dados na tabela Projeto
INSERT    INTO Projeto (ProjNum, Designacao, Fundos)
VALUES    (1, 'Controlo Baterias Elétricas', 20000.00),
          (2, 'ParticipaNaInovacaoMovel', 75000.00),
          (3, 'Fusao Optica rentável', 100000.00),
          (4, 'CoLab Felicidade', 35000.00),
          (5, 'Partilha Redes', 2000.00);

-- Inserir dados na tabela Atribuicao
INSERT    INTO Atribuicao (ProjNum, EmpNum, Funcao)
VALUES    (1, 1, 'Desenvolvimento'),
          (1, 2, 'Coordenador'),
          (1, 3, 'Motivador'),
          (2, 1, 'Desenvolvimento'),
          (4, 3, 'Coordenador'),
          (2, 2, 'Desenvolvimento'),
          (2, 5, 'Análise de requisitos');

-- Alterar tabelas
ALTER     TABLE Empregado ADD DataAniversario DATE NOT NULL DEFAULT '1900-01-01';

ALTER     TABLE Atribuicao ADD DataAtribuicao DATE NOT NULL DEFAULT GETDATE ();

ALTER     TABLE Atribuicao
ALTER     COLUMN Funcao VARCHAR(50) NOT NULL;

ALTER     TABLE Atribuicao ADD CONSTRAINT DF_DataAtribuicao DEFAULT GETDATE () FOR DataAtribuicao;

-- Atualizar dados na tabela Departamento
UPDATE    Departamento
SET       LOCAL = 'Matosinhos'
WHERE     Nome = 'Logística';

-- Apagar projetos sem empregados associados
DELETE    FROM Projeto
WHERE     ProjNum NOT IN (
          SELECT    DISTINCT ProjNum
          FROM      Atribuicao
          );

-- Atualizar salários para o departamento "Inovação e Tecnologias"
UPDATE    Empregado
SET       Salário = Salário * 1.1
WHERE     DepNum = (
          SELECT    DepNum
          FROM      Departamento
          WHERE     Nome = 'Inovação e Tecnologias'
          );
