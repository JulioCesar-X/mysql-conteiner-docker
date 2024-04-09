-- 1.
SELECT    m.nome,
          mo.nome
FROM      Marca m
JOIN      Modelo mo ON m.id = mo.id_marca;

-- 2.
SELECT    f.nome,
          MAX(COUNT(v.funcionario))
FROM      Funcionario f
JOIN      Viagem v ON f.id = v.funcionario
GROUP BY  f.nome;

-- 3.
SELECT    f.nome,
          COUNT(v.funcionario) AS viagens
FROM      Funcionario f
JOIN      Viagem v ON f.id = v.funcionario
GROUP BY  f.nome
ORDER BY  COUNT(v.funcionario) ASC;

-- 4.
SELECT    m.nome,
          mo.nome
FROM      Marca m
JOIN      Modelo mo ON m.id = mo.id_marca
JOIN      Automovel a ON a.id_modelo = mo.id
JOIN      Viagem v ON v.automovel = a.matricula
JOIN      Funcionario f ON f.id = v.funcionario
WHERE     f.nome LIKE 'A%';

-- 5.
SELECT    mo.*
FROM      Modelo mo
JOIN      Automovel a ON a.id_modelo = mo.id
JOIN      Viagem v ON v.automovel = a.matricula
WHERE     v.km_odometro BETWEEN 35 AND 100
AND       a.estado = 'A'
OR        a.estado IS NULL;

-- 6.
SELECT    a.matricula
FROM      Automovel a
JOIN      Viagem v ON a.matricula = v.automovel
GROUP BY  v.automovel
HAVING    SUM(v.km_odometro) > 475;