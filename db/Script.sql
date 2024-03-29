use Musica_2;

SELECT c.titulo, m.titulo 
FROM CD c, Musica m;

SELECT LENGTH(c.titulo), LENGTH(m.titulo) 
FROM CD c, Musica m
WHERE c.cod_cd = m.cod_cd AND
ORDER BY cod_cd DESC;

SELECT m.interprete, m.duracao, m2.interprete, m2.duracao
FROM Musica m, Musica m2 
WHERE m2.interprete ="Pink Floyd" AND
m.duracao = m2.duracao;

SELECT m.interprete, m.duracao, m2.interprete, m2.duracao
FROM Musica m, Musica m2
WHERE m2.interprete ="Pink Floyd" AND
m.duracao = m2.duracao AND
ORDER BY m.duracao DESC;

SELECT e.id_editora, e.nome, c.titulo,c.id_editora
FROM Editora e, CD c
WHERE e.id_editora <> c.id_editora;

SELECT e.id_editora, e.nome, c.titulo, c.id_editora
FROM Editora e, CD c
WHERE e.id_editora <> c.id_editora AND


SELECT COUNT(c.local_compra), c.local_compra
FROM CD c
GROUP BY c.local_compra;

SELECT COUNT(c.local_compra), c.local_compra
FROM CD c
WHERE c.local_compra IS NOT NULL
GROUP BY c.local_compra;

SELECT COUNT(c.local_compra), c.local_compra
FROM CD c
WHERE c.local_compra IS NOT NULL
GROUP BY c.local_compra
ORDER BY COUNT(c.local_compra);

SELECT COUNT(c.local_compra), c.local_compra, SUM(c.valor_pago), MAX(c.valor_pago)
FROM CD c
WHERE c.local_compra IS NOT NULL
GROUP BY c.local_compra
ORDER BY COUNT(c.local_compra);

SELECT DISTINCT c.cod_cd AND m.interprete, SUM(m.nr_musica)
FROM CD c, Musica m 
WHERE c.cod_cd = m.cod_cd
GROUP BY c.cod_cd,m.interprete, m.nr_musica;





