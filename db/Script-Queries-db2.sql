use Campeonato_1;

-- Seleções simples
-- i. Mostrar todos os dados da tabela Equipas
SELECT
    *
FROM
    Equipa;

-- ii. Mostrar todos os dados da equipa com o id igual a 12
SELECT
    *
FROM
    Equipa
WHERE
    id_equipa = 12;

-- iii. Mostrar o id e o nome de todas as equipas
SELECT
    id_equipa,
    nome
FROM
    Equipa;

-- iv. Mostrar o id, o nome e a idade dos treinadores com menos de 40 anos de idade
SELECT
    id_treinador,
    nome,
    idade
FROM
    Treinador
WHERE
    idade < 40;

-- v. Mostrar todos os dados da tabela Experiencias relativos aos treinadores que treinaram juniores ou que tenham mais do que 10 anos de experiência
SELECT
    *
FROM
    Experiencia
WHERE
    escalao = 'juniores'
    OR anos > 10;

-- vi. Mostrar todos os dados dos treinadores com idade pertencente ao intervalo [45, 53] e por ordem decrescente da idade
SELECT
    *
FROM
    Treinador
WHERE
    idade BETWEEN 45 AND 53
ORDER BY
    idade DESC;

-- vii. Mostrar todos os dados das bolas dos fabricantes Reebok e Olimpic
SELECT
    *
FROM
    Bola
WHERE
    fabricante IN ('Reebok', 'Olimpic');

-- viii. Mostrar todos os dados dos treinadores cujo nome começa pela letra A
SELECT
    *
FROM
    Treinador
WHERE
    nome LIKE 'A%';

-- Funções de agregação
-- i. Mostrar a quantidade de equipas que disputam o campeonato
SELECT
    COUNT(*) AS quantidade_equipas
FROM
    Equipa;

-- ii. Mostrar a quantidade de fabricantes distintos que produzem bolas usadas no campeonato
SELECT
    COUNT(DISTINCT fabricante) AS quantidade_fabricantes
FROM
    Bola;

-- iii. Mostrar a quantidade de treinadores com idade superior a 40 anos
SELECT
    COUNT(*) AS quantidade_treinadores
FROM
    Treinador
WHERE
    idade > 40;

-- Seleções em múltiplas tabelas - Junções (joins)
-- i. Mostrar o id das equipas que utilizam bolas do fabricante Adidas
SELECT
    E.id_equipa
FROM
    Equipa E
    JOIN Bola B ON E.id_equipa = B.id_equipa
WHERE
    B.fabricante = 'Adidas';

-- ii. Mostrar o resultado da alínea anterior, mas sem repetições
SELECT DISTINCT
    E.id_equipa
FROM
    Equipa E
    JOIN Bola B ON E.id_equipa = B.id_equipa
WHERE
    B.fabricante = 'Adidas';

-- iii. Mostrar a média das idades dos treinadores de juvenis
SELECT
    AVG(T.idade) AS media_idades
FROM
    Treinador T
    JOIN Experiencia E ON T.id_treinador = E.id_treinador
WHERE
    E.escalao = 'juvenis';

-- iv. Mostrar todos os dados dos treinadores que treinaram juniores durante 5 ou mais anos
SELECT
    T.*
FROM
    Treinador T
    JOIN Experiencia E ON T.id_treinador = E.id_treinador
WHERE
    E.escalao = 'juniores'
    AND E.anos >= 5;

-- v. Mostrar todos os dados dos treinadores e das equipas por eles treinadas
SELECT
    T.*,
    E.*
FROM
    Treinador T
    JOIN Experiencia EX ON T.id_treinador = EX.id_treinador
    JOIN Equipa E ON EX.id_equipa = E.id_equipa;

-- vi. Mostrar os nomes e os telefones dos treinadores e os nomes das equipas por eles treinadas
SELECT
    T.nome AS nome_treinador,
    T.telefone,
    E.nome AS nome_equipa
FROM
    Treinador T
    JOIN Experiencia EX ON T.id_treinador = EX.id_treinador
    JOIN Equipa E ON EX.id_equipa = E.id_equipa;

-- vii. Mostrar todos os dados da equipa do Académico e dos respetivos treinadores
SELECT
    E.*,
    T.*
FROM
    Equipa E
    JOIN Experiencia EX ON E.id_equipa = EX.id_equipa
    JOIN Treinador T ON EX.id_treinador = T.id_treinador
WHERE
    E.nome = 'Académico';

-- viii. Mostrar a idade do treinador mais velho do Académico
SELECT
    MAX(T.idade) AS idade_maxima
FROM
    Equipa E
    JOIN Experiencia EX ON E.id_equipa = EX.id_equipa
    JOIN Treinador T ON EX.id_treinador = T.id_treinador
WHERE
    E.nome = 'Académico';

-- ix. Mostrar o total de anos de experiência do treinador António do Académico
SELECT
    SUM(EX.anos) AS total_anos_experiencia
FROM
    Equipa E
    JOIN Experiencia EX ON E.id_equipa = EX.id_equipa
    JOIN Treinador T ON EX.id_treinador = T.id_treinador
WHERE
    E.nome = 'Académico'
    AND T.nome = 'António';