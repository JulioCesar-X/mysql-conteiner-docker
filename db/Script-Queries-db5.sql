use pp_5410;

-- tables
SELECT    *
FROM      automoveis;

SELECT    *
FROM      viagens;

SELECT    *
FROM      funcionarios;

-- 1. Listar o nome dos funcionários e a média de quilômetros percorridos por viagem para cada um deles
SELECT    f.nome_funcionario,
          AVG(v.km_percorridos)
FROM      viagens v,
          funcionarios f
WHERE     v.id_funcionario = f.id
GROUP BY  f.nome_funcionario;

-- 2. Mostrar a quantidade total de viagens realizadas por funcionários de cada departamento
-- opção 1
SELECT    f.departamento,
          COUNT(v.id_funcionario)
FROM      funcionarios f
JOIN      viagens v ON v.id_funcionario = f.id
GROUP BY  f.departamento;

-- opção 2
SELECT    f.departamento,
          f.nome_funcionario,
          COUNT(f.nome_funcionario) AS num_viagens
FROM      funcionarios f
JOIN      viagens v ON v.id_funcionario = f.id
GROUP BY  f.nome_funcionario,
          f.departamento;

-- 3. Listar os modelos de automóveis com uma média de consumo de combustível superior a 10 litros por 100 km
SELECT    a.modelo,
          SUM(v.combustivel_consumido) AS total_consumido, -- agregação 1
          SUM(v.km_percorridos) AS total_km_percorridos, -- agregação 2
          (
          SUM(v.combustivel_consumido) / SUM(v.km_percorridos)
          ) AS media_consumo -- agregação 3
FROM      automoveis a
JOIN      viagens v ON v.id_funcionario = a.id_funcionario
GROUP BY  a.modelo
HAVING    (
          SUM(v.combustivel_consumido) / SUM(v.km_percorridos)
          ) > 0.1;

-- média de consumo por funcionario independente do modelo usado!
SELECT    f.nome_funcionario,
          SUM(v.combustivel_consumido) AS total_consumido,
          SUM(v.km_percorridos) AS total_km_percorridos,
          (
          SUM(v.combustivel_consumido) / SUM(v.km_percorridos)
          ) AS media_consumo
FROM      funcionarios f
JOIN      viagens v ON v.id_funcionario = f.id
GROUP BY  f.nome_funcionario;

-- 4. Mostrar o nome dos funcionários que já conduziram pelo menos um modelo de cada marca de automóvel disponível na empresa
--  -- opção 1 - ter conduzido pelo menos 1 modelo de cada marca disponivel(obrigatorio ter conduzido as 3 marcas?)
SELECT    f.nome_funcionario
FROM      funcionarios f
JOIN      automoveis a ON f.id = a.id_funcionario
GROUP BY  f.nome_funcionario
HAVING    COUNT(a.marca) = (
          SELECT    COUNT(marca)
          FROM      automoveis
          );

-- -- opção 2 - ter conduzido pelo menos 1 modelo, de cada marca disponivel( não obrigatorio ter conduzido as 3 marcas?)
SELECT    f.nome_funcionario
FROM      funcionarios f
JOIN      automoveis a ON a.id_funcionario = f.id
GROUP BY  f.nome_funcionario;

HAVING    COUNT(a.modelo) >= 1;

-- 5. Listar o nome do funcionário, o modelo do automóvel e a média de quilômetros percorridos por viagem para cada combinação de funcionário e modelo de automóvel
SELECT    f.nome_funcionario,
          a.modelo,
          AVG(v.km_percorridos) AS media_km_percorridos
FROM      funcionarios f
JOIN      viagens v ON f.id = v.id_funcionario
JOIN      automoveis a ON a.id_funcionario = v.id_funcionario
GROUP BY  f.nome_funcionario,
          a.modelo
ORDER BY  a.modelo;
