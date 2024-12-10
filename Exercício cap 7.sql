--Utilizando o banco de dados ImovelNet
USE ImovelNet

--Uma busca que mostra a data atual
SELECT CURRENT_TIMESTAMP

--Uma busca na entidade IMOVEL mostrando o atributo VLPRECO com 10% de aumento
SELECT CDIMOVEL, VLPRECO, VLPRECO*1.1
FROM IMOVEL 

--Uma busca na entidade IMOVEL mostrando o atributo VLPRECO com 10% de aumento e a diferença entre VLPRECO e VLPRECO com 10% de aumento
SELECT CDIMOVEL, VLPRECO, VLPRECO*1.1, VLPRECO*.1
FROM IMOVEL 

--Uma busca na entidade VENDEDOR que mostra o atributo NMVENDEDOR me letras maiúsculas e o atributo EMAIL em letras minúsculas
SELECT UPPER(NMVENDEDOR), LOWER(EMAIL)
FROM VENDEDOR;

--Uma busca na entidade COMPRADOR que faz a concatenação dos atributos NMCOMPRADOR e NMENDERECO separados por um - 
SELECT CONCAT(NMCOMPRADOR,' - ', NMENDERECO)
FROM COMPRADOR;

--Uma busca na entidade COMPRADOR quando o atributo NMCOMPRADOR possuir a letra A em qualquer posição 
SELECT NMCOMPRADOR
FROM COMPRADOR 
WHERE NMCOMPRADOR LIKE '%A%';

--Uma busca na entidade COMPRADOR que mostra a priemira letra do atributo NMCOMPRADOR  e o atributo NMBAIRRO completp
SELECT SUBSTRING(NMCOMPRADOR,1,1), NMBAIRRO
FROM COMPRADOR
--Uma busca na entidade OFERTA que mostra o atributo CDIMOVEL e o intervalo entre a data atual e a data da oferta
SELECT CDIMOVEL, CURRENTE_DATE - DTOFERTA 
FROM OFERTA 

--Uma busca na entidade OFERTA que mostra o atributo CDIMOVE, DTLANCTO e o intervalo entre a data atual e a DTLANCTO
SELECT CDIMOVEL, DTLANCTO, CURRENTE_DATE - DTLANCTO
FROM OFERTA 

--Uma busca na entidade OFERTA que mostra o atributo CDIMOVEL, o intervalo entre a data atual e a DTLANCTO, e DTLANCTO mais 15 dias 
SELECT CDIMOVEL, DTLANCTO, CURRENTE_DATE - DTLANCTO, DTLANCTO + 15
FROM OFERTA 