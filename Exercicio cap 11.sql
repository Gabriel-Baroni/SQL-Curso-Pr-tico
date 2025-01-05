USE ImovelNet

--Fazendo a união entre as entidas comprador e vendedor e mostrando o código e o nome

SELECT CDCOMPRADOR, NMCOMPRADOR
FROM COMPRADOR
UNION 
SELECT CDVENDEDOR, NMVENDEDOR
FROM VENDEDOR 

--Fazendo a união entre as entidades comprador e vendedor e mostrando o código e o nome
SELECT CDCOMPRADOR, NMCOMPRADOR
FROM COMPRADOR
UNION ALL
SELECT CDVENDEDOR, NMVENDEDOR
FROM VENDEDOR

--Fazendo a união entre as entidades vendedor, imóvel, comprador e oferta e mostrando o nome do vendedor e o endereço do imóvel do comprador 2 e os imóveis do bairro 1
SELECT a.NMVENDEDOR, b.NMEDERECO
FROM VENDEDOR a, IMOVEL b, COMPRADOR c, OFERTA d
WHERE a.CDVENDEDOR = b.CDVENDEDOR 
AND b.CDIMOVEL = d.CDIMOVEL
AND d.CDCOMPRADOR = c.CDCOMPRADOR
AND c.CDCOMPRADOR = 2
UNION ALL
SELECT a.NMVENDEDOR, b.NMEDERECO
FROM VENDEDOR a, IMOVEL b, COMPRADOR c, OFERTA d
WHERE a.CDVENDEDOR = b.CDVENDEDOR 
AND b.CDIMOVEL = d.CDIMOVEL
AND d.CDCOMPRADOR = c.CDCOMPRADOR
AND b.CDBAIRRO = 1

--Fazendo a excessão das entidades comprador e oferta e mostrando o código do comprador que não fez oferta 
SELECT CDCOMPRADOR
FROM COMPRADOR 
EXCEPT
SELECT CDCOMPRADOR
FROM OFERTA

--Fazendo a excessão das entidades vendedor e imóvel e mostrando o código do vendedor que não tem imóvel
SELECT CDVENDEDOR
FROM VENDEDOR
EXCEPT 
SELECT CDVENDEDOR
FROM IMOVEL

--Fazendo a intersecção das entidades vendedor e imóvel e mostrando o código do vendedor que tem imóvel
SELECT CDVENDEDOR
FROM VENDEDOR 
INTERSECT 
SELECT CDVENDEDOR
FROM IMOVEL 

--Fazendo a intersecção das entidades comprador e oferta e mostrando o código do comprador que fez a oferta 
SELECT CDCOMPRADOR
FROM COMPRADOR
INTERSECT 
SELECT CDCOMPRADOR
FROM OFERTA

--Fazendo os casos de desconto no preço dos imóveis utilizando a claúsula CASE
SELECT 
    CDIMOVEL, 
    NMEDERECO,
    CASE
        WHEN VLPRECO > 100000 THEN VLPRECO * 0.9
        WHEN VLPRECO > 50000 AND VLPRECO <= 100000 THEN VLPRECO * 0.95
        WHEN VLPRECO > 30000 AND VLPRECO <= 50000 THEN VLPRECO * 0.97
        ELSE VLPRECO 
    END AS DESCONTO
FROM 
    IMOVEL;

--Fazendo o caso de STATUS do imóvel utilizando a claúsula CASE
SELECT 
    NMEDERECO, 
    CDVENDEDOR,
    CASE 
        WHEN STVENDIDO = 'S' THEN 'VENDIDO'
        ELSE 'DISPON�VEL'
    END AS STATUS
FROM IMOVEL;

--Fazendo os caso de Tipo dos imóveis utilizando a claúsula CASE
SELECT 
    CDCOMPRADOR,
    CASE 
        WHEN DTOFERTA < CURRENT_DATE - 30 THEN 'ANTIGA'
        ELSE 'NOVA'
    END AS TIPO
FROM OFERTA;


 


