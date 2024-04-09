use Projetos;

-- Consultas
-- i. Mostrar todos os empregados
SELECT    *
FROM      Empregado;

-- ii. Mostrar os campos número e nome dos empregados
SELECT    EmpNum,
          Nome
FROM      Empregado;

-- iii. Mostrar todos projetos ordenados por ordem descendente da designação
SELECT    *
FROM      Projeto
ORDER BY  Designacao DESC;

-- iv. Mostrar os empregados que têm a categoria de Gestor ou Gestora
SELECT    *
FROM      Empregado
WHERE     Categoria LIKE '%Gestor%';

-- v. Mostrar os departamentos localizados em Matosinhos e Gondomar
SELECT    *
FROM      Departamento
WHERE     LOCAL IN ('Matosinhos', 'Gondomar');

-- vi. Mostrar os nomes dos departamentos distintos associados aos empregados, ordenados por ordem alfabética
SELECT    DISTINCT D.Nome
FROM      Departamento D
JOIN      Empregado E ON D.DepNum = E.DepNum
ORDER BY  D.Nome;

-- vii. Mostrar os empregados que fazem anos nos primeiros três meses do ano
SELECT    *
FROM      Empregado
WHERE     MONTH (DataAniversario) <= 3;

-- viii. Mostrar os empregados que ganham mensalmente entre 1500 e 1950
SELECT    *
FROM      Empregado
WHERE     Salário BETWEEN 1500 AND 1950;

-- ix. Mostrar quantos empregados trabalham no Porto e na Maia
SELECT    D.Local,
          COUNT(*) AS NumEmpregados
FROM      Empregado E
JOIN      Departamento D ON E.DepNum = D.DepNum
WHERE     D.Local IN ('Porto', 'Maia')
GROUP BY  D.Local;

-- x. Mostrar a média de salários dos empregados que trabalham no departamento das vendas
SELECT    AVG(Salário) AS MediaSalario
FROM      Empregado
WHERE     DepNum = (
          SELECT    DepNum
          FROM      Departamento
          WHERE     Nome = 'Vendas'
          );

-- xi. Mostrar quantos empregados estão atribuídos por projeto
SELECT    ProjNum,
          COUNT(*) AS NumEmpregados
FROM      Atribuicao
GROUP BY  ProjNum;

-- xii. Mostrar o nome do empregado que tem menor salário
SELECT    TOP 1 Nome
FROM      Empregado
ORDER BY  Salário;