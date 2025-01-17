--Criando um schema chamado LOJA e um atributo chamado SEDE
CREATE SCHEMA LOJA
CREATE TABLE SEDE (CDLOJA INT, NMLOJA VARCHAR(50))

--Criando um domínio baseado no SEXO
CREATE TABLE Funcionario (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    SEXO CHAR(1) CHECK (SEXO IN ('M', 'F'))
);

--Criando uma visão vVendedor
CREATE VIEW vVENDEDOR  (CODIGO, NOME, ENDEREÇO) AS 
SELECT CDVENDEDOR, NMVENDEDOR, NMENDERECO 
FROM VENDEDOR 

--Olhando o conteúdo da visão
SELECT * FROM vVENDEDOR

--Criando uma visão vIMOVEL_BAIRRO1
CREATE VIEW vVIMOVEL_BAIRRO1 (CODIGO_BAIRRO, CODIGO_IMOVEL, ENDERECOO, PREÇO) AS
SELECT CDBAIRRO, CDIMOVEL, NMEDERECO, VLPRECO
FROM IMOVEL 
WHERE CDBAIRRO = 1

--Criando uma visão vIMOVEL
CREATE VIEW vIMOVEL (NOME, ENDEREÇO, BAIRRO, CIDADE, ESTADO) AS 
SELECT NMVENDEDOR,NMEDERECO, CDBAIRRO, CDCIDADE, a.SGESTADO 
FROM IMOVEL a, VENDEDOR b
WHERE a.CDVENDEDOR = b.CDVENDEDOR

--Criando uma visão vIMOVEL_CIDADE
CREATE VIEW vIMOVEL_CIDADE (preço_medio, cidade) AS
SELECT AVG(VLPRECO) MEDIA, CDCIDADE 
FROM IMOVEL 
GROUP BY CDCIDADE 

--Criando uma visão vOFERTA
CREATE VIEW vOFERTA (NOME, VALOR, ENDEREÇO) AS 
SELECT NMCOMPRADOR, VLOFERTA, NMEDERECO
FROM COMPRADOR a, OFERTA b , IMOVEL c
WHERE a.CDCOMPRADOR = b.CDCOMPRADOR 
AND b.CDIMOVEL = c.CDIMOVEL 

--Criando uma tabela temporária
CREATE TABLE ##tempVENDEDOR (
    CDVENDEDOR INT PRIMARY KEY,
    NMVENDEDOR VARCHAR(50),
    NMENDERECO VARCHAR(50)
);

--Inserindo conteúdo na tabela temporária
INSERT INTO ##tempVENDEDOR
SELECT CDVENDEDOR, NMVENDEDOR, NMENDERECO
FROM VENDEDOR
WHERE CDVENDEDOR < 5;

--Lendo o conteúdo da tabela temporária
SELECT * FROM ##tempVENDEDOR

--Fazendo um RANK dos 3 imóveis mais baratos
SELECT ROWNUM AS RANK, CDIMOVEL, NMENDERECO, VLPRECO
FROM(SELECT CDIMOVEL, NMENDERECO, VLPRECO 
FROM IMOVEL
ORDER BY VLPRECO)
WHERE ROWNUM <=3;

--Fazendo um RANK com as melhores ofertas
SELECT ROWNUM AS RANK, CDIMOVEL, NMENDERCO, VLPRECO
FROM (SELECT CDIMOVEL, CDCOMPRADOR, VLOFERTA 
FROM OFERTA 
ORDER BY VLOFERTA DESC)
WHERE ROWNUM <=5
EXCEPT 
SELECT ROWNUM AS RANK, CDIMOVEL, NMENDERCO, VLPRECO
FROM (SELECT CDIMOVEL, CDCOMPRADOR, VLOFERTA 
FROM OFERTA 
ORDER BY VLOFERTA DESC)
WHERE ROWNUM <=3
