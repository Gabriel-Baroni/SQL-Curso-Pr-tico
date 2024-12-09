USE ImovelNet

SELECT *
FROM BAIRRO

SELECT CDCOMPRADOR, NMCOMPRADOR, EMAIL
FROM COMPRADOR;

SELECT CDVENDEDOR, NMVENDEDOR, EMAIL 
FROM VENDEDOR
ORDER BY NMVENDEDOR DESC;


SELECT *
FROM BAIRRO
WHERE SGESTADO='SP'

SELECT CDIMOVEL, CDVENDEDOR, VLPRECO
FROM IMOVEL 
WHERE CDVENDEDOR=2

SELECT CDIMOVEL, CDVENDEDOR, VLPRECO, SGESTADO
FROM IMOVEL
WHERE VLPRECO<150000 AND SGESTADO='RJ'

SELECT CDIMOVEL, CDVENDEDOR, VLPRECO, SGESTADO 
FROM IMOVEL
WHERE VLPRECO<150000 OR CDVENDEDOR=1

SELECT CDIMOVEL, CDVENDEDOR, VLPRECO, SGESTADO
FROM IMOVEL
WHERE VLPRECO<150000 AND CDVENDEDOR != 2 

SELECT CDCOMPRADOR, NMCOMPRADOR, NMENDERECO, SGESTADO 
FROM COMPRADOR 
WHERE SGESTADO IS NULL

SELECT CDCOMPRADOR, NMCOMPRADOR, NMENDERECO, SGESTADO 
FROM COMPRADOR 
WHERE SGESTADO IS  NOT NULL

SELECT *
FROM OFERTA 
WHERE VLOFERTA BETWEEN 100000 AND 150000

SELECT *
FROM OFERTA 
WHERE DTOFERTA BETWEEN '01/02/02' AND '01/03/02'

SELECT *
FROM VENDEDOR
WHERE NMVENDEDOR LIKE 'M%'


SELECT *
FROM VENDEDOR
WHERE NMVENDEDOR LIKE '_A%'

SELECT *
FROM COMPRADOR
WHERE NMENDERECO LIKE '%U%'

SELECT *
FROM OFERTA
WHERE CDIMOVEL IN (2,3)

SELECT *
FROM IMOVEL
WHERE CDIMOVEL IN (2,3)
ORDER BY NMEDERECO 

SELECT *
FROM OFERTA
WHERE CDIMOVEL IN (2,3) AND VLOFERTA>140000
ORDER BY DTOFERTA DESC 

SELECT *
FROM IMOVEL
WHERE VLPRECO BETWEEN 110000 AND 200000 OR CDVENDEDOR=1
ORDER BY NRAREAUTIL