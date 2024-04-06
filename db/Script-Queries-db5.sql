use pp_5410;

-- 1. Listar o nome dos funcionários e a média de quilômetros percorridos por viagem para cada um deles
SELECT
    f.nome_funcionario,
    AVG(v.km_percorridos) AS media_quilometros
FROM
    funcionarios f
    INNER JOIN viagens v ON f.id = v.id_funcionario
GROUP BY
    f.nome_funcionario;

-- 2. Mostrar a quantidade total de viagens realizadas por funcionários de cada departamento
SELECT
    f.departamento,
    COUNT(*) AS total_viagens
FROM
    funcionarios f
    INNER JOIN viagens v ON f.id = v.id_funcionario
GROUP BY
    f.departamento;

-- 3. Listar os modelos de automóveis com uma média de consumo de combustível superior a 10 litros por 100 km
SELECT
    modelo
FROM
    automoveis
    INNER JOIN viagens ON automoveis.matricula = viagens.matricula
GROUP BY
    modelo
HAVING
    AVG(combustivel_consumido / km_percorridos) > 10;

-- 4. Mostrar o nome dos funcionários que já conduziram pelo menos um modelo de cada marca de automóvel disponível na empresa
SELECT
    f.nome_funcionario
FROM
    funcionarios f
    INNER JOIN viagens v ON f.id = v.id_funcionario
    INNER JOIN automoveis a ON v.matricula = a.matricula
GROUP BY
    f.id
HAVING
    COUNT(DISTINCT a.marca) = (
        SELECT
            COUNT(DISTINCT marca)
        FROM
            automoveis
    );

-- 5. Listar o nome do funcionário, o modelo do automóvel e a média de quilômetros percorridos por viagem para cada combinação de funcionário e modelo de automóvel
SELECT
    f.nome_funcionario,
    a.modelo,
    SUM(v.km_percorridos) / COUNT(*) AS media_quilometros
FROM
    funcionarios f
    INNER JOIN viagens v ON f.id = v.id_funcionario
    INNER JOIN automoveis a ON v.matricula = a.matricula
GROUP BY
    f.nome_funcionario,
    a.modelo;