use Musica_2;

-- select * from Musica;
-- show tables; -- See all tables in this database
show columns
from
    Musica;

-- See all columns of specific table in your database
show columns
from
    CD;

-- See all columns of specific table in your database
show columns
from
    Editora;

-- See all columns of specific table in your database
-- 1) Mostrar, numa coluna, o título de cada CD e de cada uma das músicas;
SELECT
    titulo AS titulo_cd
FROM
    CD
UNION ALL
SELECT
    titulo
FROM
    Musica;

-- 2) Copiar e alterar o comando da alínea anterior, de modo a apresentar também o comprimento de cada título e por ordem decrescente;
SELECT
    titulo AS titulo_cd,
    LENGTH (titulo) AS comprimento_titulo
FROM
    (
        SELECT
            titulo
        FROM
            CD
        UNION ALL
        SELECT
            titulo
        FROM
            Musica
    ) AS titulos
ORDER BY
    comprimento_titulo DESC;

-- 3) Mostrar a duração das músicas dos Pink Floyd que são iguais à duração de músicas de outros intérpretes;
SELECT
    Musica.duracao
FROM
    Musica
    JOIN (
        SELECT
            duracao
        FROM
            Musica
        WHERE
            interprete = 'Pink Floyd'
    ) AS PinkFloyd ON Musica.duracao = PinkFloyd.duracao
WHERE
    Musica.interprete <> 'Pink Floyd';

-- 4) Alterar o comando da alínea anterior, de modo a mostrar a duração das músicas por ordem decrescente;
SELECT
    Musica.duracao
FROM
    Musica
    JOIN (
        SELECT
            duracao
        FROM
            Musica
        WHERE
            interprete = 'Pink Floyd'
    ) AS PinkFloyd ON Musica.duracao = PinkFloyd.duracao
WHERE
    Musica.interprete <> 'Pink Floyd'
ORDER BY
    Musica.duracao DESC;

-- 5) Mostrar o id das editoras que não estão relacionadas com qualquer CD;
SELECT
    Editora.id_editora
FROM
    Editora
    LEFT JOIN CD ON Editora.id_editora = CD.id_editora
WHERE
    CD.id_editora IS NULL;

-- 6) Alterar o comando da alínea anterior, de modo a mostrar o resultado por ordem decrescente;
SELECT
    Editora.id_editora
FROM
    Editora
    LEFT JOIN CD ON Editora.id_editora = CD.id_editora
WHERE
    CD.id_editora IS NULL
ORDER BY
    Editora.id_editora DESC;

-- 7) Mostrar apenas a quantidade de CD comprados por local de compra e o respetivo local de compra;
SELECT
    COUNT(*) AS quantidade_cds,
    local_compra
FROM
    CD
GROUP BY
    local_compra;

-- 8) Copiar e alterar o comando da alínea anterior, de forma a mostrar o resultado por ordem crescente da quantidade de CD comprados;
SELECT
    COUNT(*) AS quantidade_cds,
    local_compra
FROM
    CD
GROUP BY
    local_compra
ORDER BY
    quantidade_cds;

-- 9) Copiar e alterar o comando da alínea anterior, de forma a não mostrar nulos;
SELECT
    COUNT(*) AS quantidade_cds,
    local_compra
FROM
    CD
WHERE
    local_compra IS NOT NULL
GROUP BY
    local_compra
ORDER BY
    quantidade_cds;

-- 10) Copiar e alterar o comando da alínea anterior, de forma a mostrar também, para cada local de compra, o valor total pago e o maior valor pago;
SELECT
    COUNT(*) AS quantidade_cds,
    local_compra,
    SUM(valor_pago) AS valor_total_pago,
    MAX(valor_pago) AS maior_valor_pago
FROM
    CD
WHERE
    local_compra IS NOT NULL
GROUP BY
    local_compra
ORDER BY
    quantidade_cds;

-- 11) Mostrar, para cada CD e respetivos intérpretes, a quantidade de músicas do CD em que o intérprete participa. Além da quantidade referida, também deve ser apresentado o código do CD e o intérprete;
SELECT
    CD.cod_cd,
    CD.titulo,
    Musica.interprete,
    COUNT(*) AS quantidade_musicas
FROM
    CD
    JOIN Musica ON CD.cod_cd = Musica.cod_cd
GROUP BY
    CD.cod_cd,
    CD.titulo,
    Musica.interprete;

-- 12) Copiar e alterar o comando da alínea anterior, de modo a mostrar apenas, o código do CD e o intérprete;
SELECT
    CD.cod_cd,
    Musica.interprete,
    COUNT(*) AS quantidade_musicas
FROM
    CD
    JOIN Musica ON CD.cod_cd = Musica.cod_cd
GROUP BY
    CD.cod_cd,
    Musica.interprete;

-- 13) Copiar e alterar o comando da alínea anterior, de modo a mostrar apenas o intérprete;
SELECT
    Musica.interprete,
    COUNT(*) AS quantidade_musicas
FROM
    CD
    JOIN Musica ON CD.cod_cd = Musica.cod_cd
GROUP BY
    Musica.interprete;

-- 14) Mostrar a quantidade de CD comprados em cada local de compra;
SELECT
    COUNT(*) AS quantidade_cds,
    local_compra
FROM
    CD
GROUP BY
    local_compra;

-- 15) Alterar o comando da alínea anterior, de modo a mostrar apenas as quantidades superiores a 2;
SELECT
    COUNT(*) AS quantidade_cds,
    local_compra
FROM
    CD
GROUP BY
    local_compra
HAVING
    COUNT(*) > 2;

-- 16) Mostrar os locais de compra, cujo média do valor pago por CD é inferior a 10, juntamente com o respetivo total do valor pago.
SELECT
    AVG(valor_pago) AS media_valor_pago,
    SUM(valor_pago) AS total_valor_pago,
    local_compra
FROM
    CD
GROUP BY
    local_compra
HAVING
    AVG(valor_pago) < 10;

-- 17) Mostrar o valor total pago nos locais de compra, cuja quantidade de CD comprados é inferior a 2. O local de compra também deve ser visualizado;
SELECT
    SUM(valor_pago) AS total_valor_pago,
    local_compra
FROM
    CD
GROUP BY
    local_compra
HAVING
    COUNT(*) < 2;

-- 18) Mostrar o intérprete e o código do CD em que o intérprete participa apenas em 1 música. O resultado deve ser apresentado por ordem crescente do código do CD e, em caso de igualdade, por ordem alfabética do intérprete;
SELECT
    CD.cod_cd,
    Musica.interprete
FROM
    CD
    JOIN Musica ON CD.cod_cd = Musica.cod_cd
GROUP BY
    CD.cod_cd,
    Musica.interprete
HAVING
    COUNT(*) = 1
ORDER BY
    CD.cod_cd,
    Musica.interprete;

-- 19) Copiar e alterar o comando da alínea anterior, de modo a mostrar apenas os intérpretes e sem duplicados;
SELECT DISTINCT
    Musica.interprete
FROM
    CD
    JOIN Musica ON CD.cod_cd = Musica.cod_cd
GROUP BY
    CD.cod_cd,
    Musica.interprete
HAVING
    COUNT(*) = 1
ORDER BY
    CD.cod_cd,
    Musica.interprete;

-- 20) Copiar e alterar o comando da alínea anterior, de modo a mostrar apenas os intérpretes começados por E ou L;
SELECT DISTINCT
    Musica.interprete
FROM
    CD
    JOIN Musica ON CD.cod_cd = Musica.cod_cd
WHERE
    Musica.interprete LIKE 'E%'
    OR Musica.interprete LIKE 'L%'
GROUP BY
    CD.cod_cd,
    Musica.interprete
HAVING
    COUNT(*) = 1
ORDER BY
    CD.cod_cd,
    Musica.interprete;

-- 21) Mostrar, para cada CD, o título e a quantidade de músicas;
SELECT
    CD.cod_cd,
    CD.titulo,
    COUNT(*) AS quantidade_musicas
FROM
    CD
    JOIN Musica ON CD.cod_cd = Musica.cod_cd
GROUP BY
    CD.cod_cd,
    CD.titulo;

-- 22) Mostrar, para cada CD, o código, o título e a quantidade de músicas;
SELECT
    CD.cod_cd,
    CD.titulo,
    COUNT(*) AS quantidade_musicas
FROM
    CD
    JOIN Musica ON CD.cod_cd = Musica.cod_cd
GROUP BY
    CD.cod_cd,
    CD.titulo;

-- 23) Mostrar, para cada CD, o código, o título e a quantidade de músicas, cuja duração de pelo menos uma das músicas seja superior a 5;
SELECT
    CD.cod_cd,
    CD.titulo,
    COUNT(*) AS quantidade_musicas
FROM
    CD
    JOIN Musica ON CD.cod_cd = Musica.cod_cd
WHERE
    EXISTS (
        SELECT
            1
        FROM
            Musica
        WHERE
            Musica.cod_cd = CD.cod_cd
            AND Musica.duracao > 5
    )
GROUP BY
    CD.cod_cd,
    CD.titulo;

-- 24) Mostrar, para cada CD com menos de 6 músicas, o código, o título e a quantidade de músicas do CD;
SELECT
    CD.cod_cd,
    CD.titulo,
    COUNT(*) AS quantidade_musicas
FROM
    CD
    JOIN Musica ON CD.cod_cd = Musica.cod_cd
GROUP BY
    CD.cod_cd,
    CD.titulo
HAVING
    COUNT(*) < 6;

-- 25) Mostrar, para cada CD cujas músicas têm uma duração média superior a 4, o código, o título e a quantidade de músicas do CD.
SELECT
    CD.cod_cd,
    CD.titulo,
    COUNT(*) AS quantidade_musicas
FROM
    CD
    JOIN Musica ON CD.cod_cd = Musica.cod_cd
GROUP BY
    CD.cod_cd,
    CD.titulo
HAVING
    AVG(Musica.duracao) > 4;