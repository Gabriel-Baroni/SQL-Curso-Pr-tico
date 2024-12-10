USE ImovelNet
--Pesquisando todos os atributos entidade BAIRRO
SELECT *
FROM BAIRRO

--Pesquisando os atributos CDCOMPRADOR, NMCOMPRADOR, EMAIL da entidade COMPRADOR 
SELECT CDCOMPRADOR, NMCOMPRADOR, EMAIL
FROM COMPRADOR;

--Pesquisando os atributos CDCOMPRADOR, NMCOMPRADOR, EMAIL da entidade COMPRADOR e ordenando pelo atributo NMVENDEDOR de forma decrescente
SELECT CDVENDEDOR, NMVENDEDOR, EMAIL 
FROM VENDEDOR
ORDER BY NMVENDEDOR DESC;

--Pesquisando todos os atributos da entidade BAIRRO quando o atributo SGESTADO for igual a SP
SELECT *
FROM BAIRRO
WHERE SGESTADO='SP'

--Pesquisando os atributos CDIMOVEL, CDVENDEDOR, VLPRECO da entidade IMOVEL quando o atributo CDVENDEDOR for igual a 2 
SELECT CDIMOVEL, CDVENDEDOR, VLPRECO
FROM IMOVEL 
WHERE CDVENDEDOR=2

--Pesquisando os atributos CDIMOVEL, CDVENDEDOR, VLPRECO, SGESTADO da entidade IMOVEL quando o atributo VLPRECO for menor que 150000 e SGESTADO igual a RJ
SELECT CDIMOVEL, CDVENDEDOR, VLPRECO, SGESTADO
FROM IMOVEL
WHERE VLPRECO<150000 AND SGESTADO='RJ'

--Pesquisando os atributos CDIMOVEL, CDVENDEDOR, VLPRECO, SGESTADO da entidade IMOVEL quando o atributo VLPRECO for menor que 150000 ou CDVENDEDOR igual a 1
SELECT CDIMOVEL, CDVENDEDOR, VLPRECO, SGESTADO 
FROM IMOVEL
WHERE VLPRECO<150000 OR CDVENDEDOR=1

--Pesquisando os atributos CDIMOVEL, CDVENDEDOR, VLPRECO, SGESTADO da entidade IMOVEL quando o atributo VLPRECO for menor que 150000 e CDVENDEDOR diferente de 2
SELECT CDIMOVEL, CDVENDEDOR, VLPRECO, SGESTADO
FROM IMOVEL
WHERE VLPRECO<150000 AND CDVENDEDOR != 2 

--Pesquisando os atributos CDCOMPRADOR, NMCOMPRADOR, NMENDERECO, SGESTADO da entidade COMPRAODR quando o atributo SGESTADO seja nulo
SELECT CDCOMPRADOR, NMCOMPRADOR, NMENDERECO, SGESTADO 
FROM COMPRADOR 
WHERE SGESTADO IS NULL

--Pesquisando os atributos CDCOMPRADOR, NMCOMPRADOR, NMENDERECO, SGESTADO da entidade COMPRAODR quando o atributo SGESTADO não seja nulo
SELECT CDCOMPRADOR, NMCOMPRADOR, NMENDERECO, SGESTADO 
FROM COMPRADOR 
WHERE SGESTADO IS  NOT NULL

--Pesquisando todos os atributos da entidade OFERTA quando o atributo VLOFERTA estiver entre 100000 e 150000
SELECT *
FROM OFERTA 
WHERE VLOFERTA BETWEEN 100000 AND 150000

--Pesquisando todos os atributos da entidade OFERTA quando o atributo DTOFERTA estiver entre 01/02/02 e 01/03/02
SELECT *
FROM OFERTA 
WHERE DTOFERTA BETWEEN '01/02/02' AND '01/03/02'

--Pesquisando todos os atributos da entidade VENDEDOR quando o atributo NMVENDEDOR começar com a letra M
SELECT *
FROM VENDEDOR
WHERE NMVENDEDOR LIKE 'M%'

--Pesquisando todos os atributos da entidade VENDEDOR quando o atributo NMVENDEDOR possuir a letra A na segunda posição
SELECT *
FROM VENDEDOR
WHERE NMVENDEDOR LIKE '_A%'

--Pesquisando todos os atributos da entidade COMPRADOR quando o atributo NMVENDEDOR possuir a letra U em qualquer posição
SELECT *
FROM COMPRADOR
WHERE NMENDERECO LIKE '%U%'

--Pesquisando todos os atributos da entidade OFERTA quando o atributo CDIMOVEL for 1 ou 2
FROM OFERTA
WHERE CDIMOVEL IN (1,2)

--Pesquisando todos os atributos da entidade IMOVEL quando o atributo CDIMOVEL for 2 ou 3 e ordenando de forma alfabética pelo atributo NMENDERECO
SELECT *
FROM IMOVEL
WHERE CDIMOVEL IN (2,3)
ORDER BY NMEDERECO 

--Pesquisando todos os atributos da entidade OFERTA quando o atributo CDIMOVEL for 2 ou 3 e VLOFERTA for maior que 140000, ordenando de forma decrescente pelo atributo DTOFERTA
SELECT *
FROM OFERTA
WHERE CDIMOVEL IN (2,3) AND VLOFERTA>140000
ORDER BY DTOFERTA DESC 

--Pesquisando todos os atributos da entidade IMOVEL quando o atributo VLPRECO estiver entre 110000 e 200000 ou o CDVENDEDOR for igual a 1, ordenando pelo atributo NRAREAUTIL
SELECT *
FROM IMOVEL
WHERE VLPRECO BETWEEN 110000 AND 200000 OR CDVENDEDOR=1
ORDER BY NRAREAUTIL