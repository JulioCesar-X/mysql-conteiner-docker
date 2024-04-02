
use Musica_2;

-- 1) Mostrar, numa coluna, o título de cada CD e de cada uma das músicas:
SELECT titulo AS titulo_cd FROM CD
UNION ALL
SELECT titulo AS titulo_musica FROM Musica;

-- 2) Copiar e alterar o comando da alínea anterior, de modo a apresentar também o comprimento de cada título e por ordem decrescente:
SELECT titulo AS titulo_cd, LENGTH(titulo) AS comprimento FROM CD
UNION ALL
SELECT titulo AS titulo_musica, LENGTH(titulo) AS comprimento FROM Musica
ORDER BY comprimento DESC;

-- 3) Mostrar a duração das músicas dos Pink Floyd que são iguais à duração de músicas de outros intérpretes:
SELECT m.duracao
FROM Musica m
WHERE m.interprete = 'Pink Floyd'
AND m.duracao IN (SELECT duracao FROM Musica WHERE interprete != 'Pink Floyd');

-- 4) Alterar o comando da alínea anterior, de modo a mostrar a duração das músicas por ordem decrescente:
SELECT m.duracao
FROM Musica m
WHERE m.interprete = 'Pink Floyd'
AND m.duracao IN (SELECT duracao FROM Musica WHERE interprete != 'Pink Floyd')
ORDER BY m.duracao DESC;

-- 5) Mostrar o id das editoras que não estão relacionadas com qualquer CD:
SELECT id_editora
FROM Editora
WHERE id_editora NOT IN (SELECT DISTINCT id_editora FROM CD);

-- 6) Alterar o comando da alínea anterior, de modo a mostrar o resultado por ordem decrescente:
SELECT id_editora
FROM Editora
WHERE id_editora NOT IN (SELECT DISTINCT id_editora FROM CD)
ORDER BY id_editora DESC;

-- 7) Mostrar apenas a quantidade de CD comprados por local de compra e o respetivo local de compra:
SELECT COUNT(*) AS quantidade, local_compra
FROM CD
GROUP BY local_compra;

-- 8) Copiar e alterar o comando da alínea anterior, de forma a mostrar o resultado por ordem crescente da quantidade de CD comprados:
SELECT COUNT(*) AS quantidade, local_compra
FROM CD
GROUP BY local_compra
ORDER BY quantidade ASC;

-- 9) Copiar e alterar o comando da alínea anterior, de forma a não mostrar nulos:
SELECT COUNT(local_compra) AS quantidade, local_compra
FROM CD
WHERE local_compra IS NOT NULL
GROUP BY local_compra
ORDER BY quantidade ASC;

-- 10) Copiar e alterar o comando da alínea anterior, de forma a mostrar também, para cada local de compra, o valor total pago e o maior valor pago:
SELECT COUNT(*) AS quantidade, local_compra, SUM(valor_pago) AS total_pago, MAX(valor_pago) AS maior_valor_pago
FROM CD
WHERE local_compra IS NOT NULL
GROUP BY local_compra
ORDER BY quantidade ASC;

-- 11) Mostrar, para cada CD e respetivos intérpretes, a quantidade de músicas do CD em que o intérprete participa. Além da quantidade referida, também deve ser apresentado o código do CD e o intérprete:
SELECT c.cod_cd, m.interprete, COUNT(*) AS quantidade_musica
FROM CD c
JOIN Musica m ON c.cod_cd = m.cod_cd
GROUP BY c.cod_cd, m.interprete;

-- 12) Copiar e alterar o comando da alínea anterior, de modo a mostrar apenas, o código do CD e o intérprete:
SELECT c.cod_cd, m.interprete
FROM CD c
JOIN Musica m ON c.cod_cd = m.cod_cd
GROUP BY c.cod_cd, m.interprete;

-- 13) Copiar e alterar o comando da alínea anterior, de modo a mostrar apenas o intérprete:
SELECT m.interprete
FROM CD c
JOIN Musica m ON c.cod_cd = m.cod_cd
GROUP BY m.interprete;

-- 14) Mostrar a quantidade de CD comprados em cada local de compra:
SELECT COUNT(*) AS quantidade, local_compra
FROM CD
GROUP BY local_compra;

-- 15) Alterar o comando da alínea anterior, de modo a mostrar apenas as quantidades superiores a 2:
SELECT COUNT(*) AS quantidade, local_compra
FROM CD
GROUP BY local_compra
HAVING COUNT(*) > 2;

-- 16) Mostrar os locais de compra, cuja média do valor pago por CD é inferior a 10, juntamente com o respetivo total do valor pago.
SELECT local_compra, AVG(valor_pago) AS media_valor_pago, SUM(valor_pago) AS total_pago
FROM CD
GROUP BY local_compra
HAVING AVG(valor_pago) < 10;

-- 17) Mostrar o valor total pago nos locais de compra, cuja quantidade de CD comprados é inferior a 2. O local de compra também deve ser visualizado:
SELECT local_compra, SUM(valor_pago) AS total_pago
FROM CD
GROUP BY local_compra
HAVING COUNT(*) < 2;

-- 18) Mostrar o intérprete e o código do CD em que o intérprete participa apenas em 1 música. O resultado deve ser apresentado por ordem crescente do código do CD e, em caso de igualdade, por ordem alfabética do intérprete;
SELECT m.interprete, c.cod_cd
FROM Musica m
JOIN CD c ON m.cod_cd = c.cod_cd
GROUP BY m.interprete, c.cod_cd
HAVING COUNT(*) = 1
ORDER BY c.cod_cd ASC, m.interprete ASC;

-- 19) Copiar e alterar o comando da alínea anterior, de modo a mostrar apenas os intérpretes e sem duplicados;
SELECT DISTINCT m.interprete
FROM Musica m
JOIN CD c ON m.cod_cd = c.cod_cd
GROUP BY m.interprete, c.cod_cd
HAVING COUNT(*) = 1
ORDER BY m.interprete ASC;

-- 20) Copiar e alterar o comando da alínea anterior, de modo a mostrar apenas os intérpretes começados por E ou L;
SELECT DISTINCT m.interprete
FROM Musica m
JOIN CD c ON m.cod_cd = c.cod_cd
WHERE m.interprete LIKE 'E%' OR m.interprete LIKE 'L%'
GROUP BY m.interprete, c.cod_cd
HAVING COUNT(*) = 1
ORDER BY m.interprete ASC;

-- 21) Mostrar, para cada CD, o título e a quantidade de músicas;
SELECT c.titulo, COUNT(*) AS quantidade_musicas
FROM CD c
JOIN Musica m ON c.cod_cd = m.cod_cd
GROUP BY c.titulo;

-- 22) Mostrar, para cada CD, o código, o título e a quantidade de músicas;
SELECT c.cod_cd, c.titulo, COUNT(*) AS quantidade_musicas
FROM CD c
JOIN Musica m ON c.cod_cd = m.cod_cd
GROUP BY c.cod_cd, c.titulo;

-- 23) Mostrar, para cada CD, o código, o título e a quantidade de músicas, cuja duração de pelo menos uma das músicas seja superior a 5;
SELECT c.cod_cd, c.titulo, COUNT(*) AS quantidade_musicas
FROM CD c
JOIN Musica m ON c.cod_cd = m.cod_cd
WHERE EXISTS (SELECT 1 FROM Musica WHERE cod_cd = c.cod_cd AND duracao > 5)
GROUP BY c.cod_cd, c.titulo;

-- 24) Mostrar, para cada CD com menos de 6 músicas, o código, o título e a quantidade de músicas do CD;
SELECT c.cod_cd, c.titulo, COUNT(*) AS quantidade_musicas
FROM CD c
JOIN Musica m ON c.cod_cd = m.cod_cd
GROUP BY c.cod_cd, c.titulo
HAVING COUNT(*) < 6;

-- 25) Mostrar, para cada CD cujas músicas têm uma duração média superior a 4, o código, o título e a quantidade de músicas do CD.
SELECT c.cod_cd, c.titulo, COUNT(*) AS quantidade_musicas
FROM CD c
JOIN Musica m ON c.cod_cd = m.cod_cd
GROUP BY c.cod_cd, c.titulo
HAVING AVG(m.duracao) > 4;