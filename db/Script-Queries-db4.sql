use Empresa;

-- 1.1. Nome e preço dos produtos que foram comprados mais de uma vez
SELECT
    Nome,
    Preco
FROM
    Produto
WHERE
    ProdutoID IN (
        SELECT
            ProdutoID
        FROM
            LinhasDeFatura
        GROUP BY
            ProdutoID
        HAVING
            COUNT(*) > 1
    );

-- 1.2. Nome e email de clientes que compraram produtos da categoria 'Eletrônicos' e não compraram nenhum 
-- produto da categoria 'Roupas'
SELECT
    Nome,
    Email
FROM
    Cliente
WHERE
    ClienteID IN (
        SELECT DISTINCT
            F.ClienteID
        FROM
            Fatura F
            JOIN LinhasDeFatura LF ON F.FaturaID = LF.FaturaID
            JOIN Produto P ON LF.ProdutoID = P.ProdutoID
            JOIN CategoriaProduto CP ON P.CategoriaID = CP.CategoriaID
        WHERE
            CP.Nome = 'Eletrônicos'
    )
    AND ClienteID NOT IN (
        SELECT DISTINCT
            F.ClienteID
        FROM
            Fatura F
            JOIN LinhasDeFatura LF ON F.FaturaID = LF.FaturaID
            JOIN Produto P ON LF.ProdutoID = P.ProdutoID
            JOIN CategoriaProduto CP ON P.CategoriaID = CP.CategoriaID
        WHERE
            CP.Nome = 'Roupas'
    );

-- 1.3. Nome e endereço dos clientes que gastaram mais de $500 em uma única fatura:
SELECT
    Nome,
    Endereco
FROM
    Cliente
WHERE
    ClienteID IN (
        SELECT
            ClienteID
        FROM
            Fatura
        WHERE
            ValorTotal > 500
    );

-- 1.4. Nome e preço dos produtos que foram comprados por mais de um cliente:
SELECT
    Nome,
    Preco
FROM
    Produto
WHERE
    ProdutoID IN (
        SELECT
            ProdutoID
        FROM
            LinhasDeFatura
        GROUP BY
            ProdutoID
        HAVING
            COUNT(DISTINCT FaturaID) > 1
    );

-- 1.5. Nome e valor total de todas as faturas onde o valor total é maior do que a média do valor total de todas as faturas:
SELECT
    C.Nome,
    F.ValorTotal
FROM
    Fatura F
    JOIN Cliente C ON F.ClienteID = C.ClienteID
WHERE
    F.ValorTotal > (
        SELECT
            AVG(ValorTotal)
        FROM
            Fatura
    );

-- 1.6. Obtenha o nome e o email de todos os clientes que gastaram mais de $500 em uma única fatura:
SELECT
    Nome,
    Email
FROM
    Cliente
WHERE
    ClienteID IN (
        SELECT
            ClienteID
        FROM
            Fatura
        WHERE
            ValorTotal > 500
    );

-- 1.7. Encontre o nome de todos os produtos que foram comprados por clientes com o nome "João":
SELECT
    P.Nome
FROM
    Produto P
    JOIN LinhasDeFatura LF ON P.ProdutoID = LF.ProdutoID
    JOIN Fatura F ON LF.FaturaID = F.FaturaID
    JOIN Cliente C ON F.ClienteID = C.ClienteID
WHERE
    C.Nome = 'João';

-- 1.8. Descubra o nome de todos os clientes que compraram produtos de uma categoria com mais de 10 unidades em uma única fatura:
SELECT
    C.Nome
FROM
    Cliente C
    JOIN Fatura F ON C.ClienteID = F.ClienteID
    JOIN LinhasDeFatura LF ON F.FaturaID = LF.FaturaID
    JOIN Produto P ON LF.ProdutoID = P.ProdutoID
WHERE
    P.CategoriaID IN (
        SELECT
            CategoriaID
        FROM
            Produto
        GROUP BY
            CategoriaID
        HAVING
            SUM(Stock) > 10
    );

-- 1.9. Obtenha o nome de todos os produtos que foram comprados por mais de 3 clientes diferentes:
SELECT
    P.Nome
FROM
    Produto P
    JOIN LinhasDeFatura LF ON P.ProdutoID = LF.ProdutoID
GROUP BY
    P.ProdutoID,
    P.Nome
HAVING
    COUNT(DISTINCT LF.FaturaID) > 3;

-- 1.10. Encontre o nome de todos os produtos que foram comprados por clientes que também compraram produtos com preço superior a $100:
SELECT DISTINCT
    P.Nome
FROM
    Produto P
    JOIN LinhasDeFatura LF ON P.ProdutoID = LF.ProdutoID
    JOIN Fatura F ON LF.FaturaID = F.FaturaID
WHERE
    F.ClienteID IN (
        SELECT DISTINCT
            F2.ClienteID
        FROM
            Fatura F2
            JOIN LinhasDeFatura LF2 ON F2.FaturaID = LF2.FaturaID
            JOIN Produto P2 ON LF2.ProdutoID = P2.ProdutoID
        WHERE
            P2.Preco > 100
    );

-- 1.11. Descubra o nome de todos os clientes que compraram pelo menos um produto de cada categoria:
SELECT
    C.Nome
FROM
    Cliente C
WHERE
    (
        SELECT
            COUNT(DISTINCT P.CategoriaID)
        FROM
            Produto P
    ) = (
        SELECT
            COUNT(DISTINCT P.CategoriaID)
        FROM
            Produto P
            JOIN LinhasDeFatura LF ON P.ProdutoID = LF.ProdutoID
            JOIN Fatura F ON LF.FaturaID = F.FaturaID
        WHERE
            F.ClienteID = C.ClienteID
    );

-- 1.12. Encontre o nome de todos os produtos que nunca foram comprados por clientes com endereço em "Rua A":
SELECT
    P.Nome
FROM
    Produto P
WHERE
    P.ProdutoID NOT IN (
        SELECT DISTINCT
            LF.ProdutoID
        FROM
            LinhasDeFatura LF
            JOIN Fatura F ON LF.FaturaID = F.FaturaID
            JOIN Cliente C ON F.ClienteID = C.ClienteID
        WHERE
            C.Endereco = 'Rua A'
    );

-- 1.13. Obtenha o nome e o total de todas as faturas onde o cliente comprou pelo menos um produto com estoque atual menor que 10 unidades:
SELECT
    C.Nome,
    F.ValorTotal
FROM
    Cliente C
    JOIN Fatura F ON C.ClienteID = F.ClienteID
WHERE
    F.FaturaID IN (
        SELECT
            F.FaturaID
        FROM
            Fatura F
            JOIN LinhasDeFatura LF ON F.FaturaID = LF.FaturaID
            JOIN Produto P ON LF.ProdutoID = P.ProdutoID
        WHERE
            P.Stock < 10
    );

-- 1.14. Descubra o nome e o preço de todos os produtos que foram comprados por clientes que já compraram produtos de pelo menos duas categorias diferentes:
SELECT DISTINCT
    P.Nome,
    P.Preco
FROM
    Produto P
    JOIN LinhasDeFatura LF ON P.ProdutoID = LF.ProdutoID
    JOIN Fatura F ON LF.FaturaID = F.FaturaID
WHERE
    F.ClienteID IN (
        SELECT
            F.ClienteID
        FROM
            Fatura F
            JOIN LinhasDeFatura LF ON F.FaturaID = LF.FaturaID
            JOIN Produto P ON LF.ProdutoID = P.ProdutoID
        GROUP BY
            F.ClienteID
        HAVING
            COUNT(DISTINCT P.CategoriaID) >= 2
    );

-- 1.15. Encontre o nome de todos os clientes que compraram pelo menos um produto que também foi comprado por clientes com idade superior a 40 anos:
SELECT DISTINCT
    C.Nome
FROM
    Cliente C
    JOIN Fatura F ON C.ClienteID = F.ClienteID
    JOIN LinhasDeFatura LF ON F.FaturaID = LF.FaturaID
    JOIN Produto P ON LF.ProdutoID = P.ProdutoID
WHERE
    P.ProdutoID IN (
        SELECT DISTINCT
            LF.ProdutoID
        FROM
            LinhasDeFatura LF
            JOIN Fatura F ON LF.FaturaID = F.FaturaID
            JOIN Cliente C ON F.ClienteID = C.ClienteID
        WHERE
            C.Idade > 40
    );