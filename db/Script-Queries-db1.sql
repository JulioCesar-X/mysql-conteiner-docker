use Musica_1;


show tables; -- See all tables in this database

show columns from Musica; -- See all columns of specific table in your database
show columns from CD; -- See all columns of specific table in your database


-- i. Mostrar todos os dados da tabela CD;
SELECT * FROM CD;

-- ii. Mostrar o título e a data de compra de todos os CD;
SELECT titulo, data_compra FROM CD;

-- iii. Mostrar a data de compra de todos CD;
SELECT data_compra FROM CD;

-- iv. Mostrar o resultado da alínea anterior, mas sem repetições;
SELECT DISTINCT data_compra FROM CD;

-- v. Mostrar o código do CD e o intérprete de todas as músicas;
SELECT Musica.cod_cd, Musica.interprete
FROM Musica, CD
WHERE Musica.cod_cd = CD.cod_cd;

-- vi. Mostrar o resultado da alínea anterior, mas sem repetições;
SELECT DISTINCT Musica.cod_cd, Musica.interprete
FROM Musica, CD
WHERE Musica.cod_cd = CD.cod_cd;

-- vii. Mostrar a data de compra de todos os CD com o resultado intitulado "Data de Compra";
SELECT data_compra AS "Data de Compra" FROM CD;

-- viii. Mostrar o título, o valor pago e o respetivo valor do IVA de todos os CD;
SELECT titulo, valor_pago, valor_pago * 0.23 AS "Valor do IVA" FROM CD;

-- ix. Mostrar todos os dados de todas as músicas do CD com o código 2;
SELECT * FROM Musica WHERE cod_cd = 2;

-- x. Mostrar todos os dados de todas as músicas que não pertencem ao CD com o código 2;
SELECT * FROM Musica WHERE cod_cd <> 2;

-- xi. Mostrar todos os dados de todas as músicas do CD com o código 2 cuja duração seja superior a 5;
SELECT * FROM Musica WHERE cod_cd = 2 AND duracao > 5;

-- xii. Mostrar todos os dados das músicas do CD com o código 2 cuja duração pertença ao intervalo [4,6];
SELECT * FROM Musica WHERE cod_cd = 2 AND duracao BETWEEN 4 AND 6;

-- xiii. Mostrar todos os dados das músicas do CD com o código 2 cuja duração seja inferior a 4 ou superior a 6;
SELECT * FROM Musica WHERE cod_cd = 2 AND (duracao < 4 OR duracao > 6);

-- xiv. Mostrar todos os dados das músicas com os números: 1, 3, 5 ou 6;
SELECT * FROM Musica WHERE nr_musica IN (1, 3, 5, 6);

-- xv. Mostrar todos os dados das músicas com os números diferentes de 1, 3, 5 e 6;
SELECT * FROM Musica WHERE nr_musica NOT IN (1, 3, 5, 6);

-- xvi. Mostrar os títulos dos CD comprados na FNAC;
SELECT titulo FROM CD WHERE local_compra = 'FNAC';

-- xvii. Mostrar os títulos dos CD que não foram comprados na FNAC;
SELECT titulo FROM CD WHERE local_compra <> 'FNAC';

-- xviii. Mostrar todos os dados das músicas cujo intérprete é uma orquestra;
SELECT * FROM Musica WHERE interprete LIKE '%orquestra%';

-- xix. Mostrar todos os dados das músicas cujo intérprete tem um Y;
SELECT * FROM Musica WHERE interprete LIKE '%Y%';

-- xx. Mostrar todos os dados das músicas cujo nome termina com DAL?, sendo ? qualquer caractere;
SELECT * FROM Musica WHERE titulo LIKE '%DAL_';

-- xxi. Mostrar todos os dados das músicas cujo título tem o caractere %;
SELECT * FROM Musica WHERE titulo LIKE '%[%]%';

-- xxii. Mostrar todos os dados das músicas cujo título é iniciado pela letra B, D ou H;
SELECT * FROM Musica WHERE titulo LIKE 'B%' OR titulo LIKE 'D%' OR titulo LIKE 'H%';

-- xxiii. Mostrar todos os dados dos CD sem o local de compra registado;
SELECT * FROM CD WHERE local_compra IS NULL;

-- xxiv. Mostrar todos os dados dos CD com o local de compra registado.
SELECT * FROM CD WHERE local_compra IS NOT NULL;