--Usando o banco de dados ImovelNet
USE ImovelNet

--Consultando os atributos de duas entidades (IMOVEL e VENDEDOR) com os alias respectivos: "a" e "b"
SELECT a.CDIMOVEL, b.CDVENDEDOR, b.NMVENDEDOR, a.SGESTADO
FROM IMOVEL a, VENDEDOR b
WHERE  a.CDVENDEDOR = B.CDVENDEDOR

--Consulando os atributos de duas entidades diferentes (COMPRADOR e OFERTA) com os alias respectivos: "a" e "b" 
SELECT a.CDCOMPRADOR, a.NMCOMPRADOR, b.CDIMOVEL, B.VLOFERTA
FROM COMPRADOR a, OFERTA b 
WHERE a.CDCOMPRADOR = b.CDCOMPRADOR

----Consulando os atributos de duas entidades diferentes (IMOVEL e BAIRRO) com os alias respectivos: "a" e "b"  e mostrando somente se for o comprador 3
SELECT a.CDIMOVEL, a.VLPRECO, b.NMBAIRRO
FROM IMOVEL a, BAIRRO b 
WHERE a.CDVENDEDOR = 3
AND a.CDBAIRRO = b.CDBAIRRO
AND a.CDCIDADE = b.CDCIDADE
AND a.SGESTADO = b.SGESTADO

--Mostrando todos os imóveis que possuem ofertas cadastradas 
SELECT DISTINCT a.CDIMOVEL
FROM IMOVEL a INNER JOIN OFERTA b
ON a.CDIMOVEL = b.CDIMOVEL

--Mostrando, através do "LEFT JOIN", todas as linhas da tabela IMOVEL, mesmo aquelas que não atendem o requisito. Mostra os imovéis até sem oferta
SELECT a.CDIMOVEL, b.VLOFERTA
FROM IMOVEL a
LEFT JOIN OFERTA b
ON a.CDIMOVEL = b.CDIMOVEL;

--Consultando todos os compradores que fizeram alguma oferta
SELECT a.CDCOMPRADOR, a.NMCOMPRADOR, B.VLOFERTA 
FROM COMPRADOR a, OFERTA b
WHERE a.CDCOMPRADOR = b.CDCOMPRADOR

--Consultando todos os compradores, até mesmo aqueles que não possuem ofertas
SELECT a.CDCOMPRADOR, a.NMCOMPRADOR, B.VLOFERTA 
FROM COMPRADOR a LEFT JOIN OFERTA b
ON a.CDCOMPRADOR = b.CDCOMPRADOR

--Conuslta recursiva, ou seja, consultando a entidade IIMOVEL a partir dela mesma
SELECT a.NMEDERECO, a.CDIMOVEL, b.NMEDERECO IMOVEL_INDICADO
FROM IMOVEL a, IMOVEL b 
WHERE a.IMOVEL_INDICADO = b.CDIMOVEL

--Consulta recursiva com a entidade IMOVEL e VENDEDOR
SELECT a.NMEDERECO, a.CDIMOVEL, b.NMEDERECO IMOVEL_INDICADO, c.NMVENDEDOR, d.NMVENDEDOR IMOVEL_INDICADO_VENDEDOR
FROM IMOVEL a, IMOVEL b, VENDEDOR c, VENDEDOR d
WHERE a.IMOVEL_INDICADO = b.CDIMOVEL
AND a.CDVENDEDOR = c.CDVENDEDOR
AND b.CDVENDEDOR = d.CDVENDEDOR

--Consultando onde o preço do IMOVEL se encaixa na faixa de preço, a partir de um intervalo de valores
SELECT a.NMEDERECO, b.NMBAIRRO, c.NMFAIXA
FROM IMOVEL a, BAIRRO b, FAIXA_IMOVEL c
WHERE a.VLPRECO BETWEEN c.VLMINIMO AND c.VLMAXIMO AND 
a.CDBAIRRO = b.CDBAIRRO AND
a.CDCIDADE = b.CDCIDADE AND
a.SGESTADO = b.SGESTADO
