--Usando o banco de dados criado ImovelNet
USE ImovelNet

--Fazendo uma subquery, onde é mostrado uma lista dos imóveis que tenham o bairro igual a do imóvel 2, mas excluindo o imóvel 2
SELECT CDIMOVEL, NMEDERECO 
FROM IMOVEL 
WHERE CDBAIRRO = (SELECT CDBAIRRO 
FROM IMOVEL 
WHERE CDIMOVEL = 2) AND CDIMOVEL != 2

--Fazendo uma subquery, onde é mostrado uma lista dos imóveis que tenham o preço maior que a média de preço de todos os imóveis
SELECT CDIMOVEL, NMEDERECO 
FROM IMOVEL 
WHERE VLPRECO > (SELECT AVG(VLPRECO) 
FROM IMOVEL) 

--Fazendo uma subquery, onde é mostrado uma lista dos compradores que tenham ofertas maiores de 70 mil
SELECT a.CDCOMPRADOR, NMCOMPRADOR, b.VLOFERTA 
FROM COMPRADOR a, OFERTA b
WHERE a.CDCOMPRADOR = b.CDCOMPRADOR AND
b.VLOFERTA > 70000

--Fazendo uma subquery, onde é mostrado uma lista dos imóveis que tenham um valor de oferta maior que a média de todas as ofertas
SELECT CDIMOVEL, CDCOMPRADOR, VLOFERTA
FROM OFERTA 
WHERE VLOFERTA > (SELECT AVG(VLOFERTA)
FROM OFERTA)

--Fazendo uma subquery, onde é mostrado uma lista dos imóveis que tenham preço maior que a média de preço de todos os imóveis do mesmo bairro
SELECT a.CDIMOVEL NMEDERECO, VLPRECO
FROM IMOVEL a 
WHERE VLPRECO > (SELECT AVG(VLPRECO)
FROM IMOVEL b 
WHERE a.CDBAIRRO = b.CDBAIRRO)

--Fazendo uma subquery, onde é mostrado uma lista dos imóveis que tenham o preço maior que a média de preço e agrupados por bairro
SELECT CDBAIRRO, AVG(VLPRECO) M�DIA 
FROM IMOVEL
GROUP BY CDBAIRRO
HAVING MAX(VLPRECO) > (SELECT AVG(VLPRECO)
FROM IMOVEL)

--Fazendo uma subquery, onde é mostrado uma lista dos imóveis que tenham op preoço menor que cada vendedor
SELECT CDIMOVEL, VLPRECO, a.CDVENDEDOR
FROM IMOVEL a
WHERE VLPRECO = (SELECT MIN(VLPRECO)
FROM IMOVEL b
WHERE a.CDVENDEDOR = b.CDVENDEDOR)

--Fazendo uma subquery, onde é mostrado uma lista dos imóveis que tenham a data de lançamento inferior a 30 dias e supereior a 180 dias a partir de hoje e que o vendedor seja o 2
SELECT b.CDCOMPRADOR, a.DTLANCTO, a.CDIMOVEL
FROM IMOVEL a, OFERTA b 
WHERE a.CDIMOVEL = b.CDIMOVEL AND
a.DTLANCTO BETWEEN CURRENT_TIMESTAMP - 180
AND CURRENT_TIMESTAMP - 30
AND CDVENDEDOR = 2

--Fazendo uma subquery, onde é mostrado uma lista dos imóveis que tenham o preço menor ou igual ao menor preço de todos os vendedores, menos os pimóveis do próprio vendedor
SELECT CDIMOVEL, VLPRECO, NMEDERECO
FROM IMOVEL a
WHERE VLPRECO <= (SELECT MIN(VLPRECO)
FROM IMOVEL
WHERE CDVENDEDOR != a.CDVENDEDOR )

--Fazendo uma subquery, onde é mostrado uma lista doas ofertas menores que todas as outras do comprador 2, menos as do comprador 2
SELECT VLOFERTA, CDCOMPRADOR
FROM OFERTA 
WHERE VLOFERTA < (SELECT MAX(VLOFERTA) 
FROM OFERTA 
WHERE CDCOMPRADOR = 2)
AND CDCOMPRADOR !=2

--Fazendo uma subquery, onde é mostrado uma lista dos imóveis que tenham o mesmo estado e cidade do vendedor 3, menos os imóveis do vendedor 3
SELECT CDIMOVEL, NMEDERECO
FROM IMOVEL 
WHERE (SGESTADO, CDCIDADE) IN (SELECT SGESTADO
FROM VENDEDOR 
WHERE CDVENDEDOR = 3) 
AND CDVENDEDOR !=3

--Fazendo uma subquery, onde é mostrado uma lista dos bairros que tenham imóveis de mesmo estado, cidade e bairro do imóvel 5
SELECT NMBAIRRO
FROM BAIRRO
WHERE (SGESTADO, CDCIDADE, CDBAIRRO) IN (SELECT SGESTADO, CDBAIRRO, CDCIDADE
FROM IMOVEL
WHERE CDIMOVEL =5) 

