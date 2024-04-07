use cadastro;

show tables;

show columns
FROM      cursos;

show columns
FROM      gafanhotos;

-- Filtrar por colunas significa especificar  no select quais colunas vc quer mostrar na query
SELECT    *
FROM      gafanhotos;

SELECT    *
FROM      cursos;

-- Apenas com G , tornando não case sensitive e apenas valores únicos
SELECT    DISTINCT nome
FROM      gafanhotos
WHERE     BINARY LEFT (nome, 1) = 'G';

-- filtra nas linhas a partir de uma condição que seta a coluna nome
SELECT    DISTINCT nome
FROM      gafanhotos;

-- Apenas com G , tornando não case sensitive 
SELECT    *
FROM      gafanhotos
WHERE     BINARY LEFT (nome, 1) = 'G';

-- Ordenar usando o ORDER BY
SELECT    *
FROM      gafanhotos
ORDER BY  nome DESC;

SELECT    *
FROM      cursos
ORDER BY  nome DESC;

SELECT    ano,
          nome,
          carga
FROM      cursos
ORDER BY  ano DESC,
          nome DESC,
          carga;

-- Usando condicionais com WHERE
SELECT    nome,
          ano
FROM      cursos
WHERE     ano IN (2015, 2018) -- igual a 2015 ou igual a 2018
ORDER BY  ano DESC;

SELECT    nome,
          ano
FROM      cursos
WHERE     ano BETWEEN 2015 AND 2018 -- sempre inclusive ambas as pontas 
ORDER BY  ano DESC;

SELECT    nome -- apenas coluna nome
FROM      cursos
WHERE     ano BETWEEN 2015 AND 2018 -- sempre inclusive ambas as pontas 
ORDER BY  ano DESC;

SELECT    nome,
          ano
FROM      cursos
WHERE     ano NOT BETWEEN 2015 AND 2018 -- significa que não quero o intervalo especificado
ORDER BY  ano DESC;

SELECT    nome,
          ano
FROM      cursos
WHERE     ano > 2015
AND       ano < 2018 -- retirando o 2015 e 2018 da consulta
ORDER BY  ano DESC;

SELECT    *
FROM      cursos
WHERE     nome = 'PHP';

SELECT    *
FROM      cursos
WHERE     nome LIKE 'P%';

Funções de agregação (agrupamento)
SELECT    *
FROM      cursos;

SELECT    COUNT(*) -- contar todos inclusive os null
FROM      cursos;

SELECT    (
          SELECT    COUNT(*)
          FROM      cursos
          ) AS total,
          (
          SELECT    COUNT(*)
          FROM      cursos
          WHERE     nome LIKE 'p%'
          ) AS totalps;
