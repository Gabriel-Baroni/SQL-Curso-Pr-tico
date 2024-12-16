--Usando o banco de dados ImovelNet
USE ImovelNet
 
 --Selecionando a oferta de valor máximo e mínimo e a média de todas as ofertas
SELECT MAX(VLOFERTA) MAIOR, MIN(VLOFERTA) MENOR, AVG(VLOFERTA) MEDIA
FROM OFERTA 

--Selecionando o desvio padrão e a variância dos preços dos imóveis
SELECT STDEV(VLPRECO) DESVIO_PADRAO, VAR(VLPRECO) VARINCIA 
FROM IMOVEL

--Selecionando o desvio padrão e a variância dos preços dos imóveis, porém mostrando o resultado com duas casas decimais 
SELECT CAST(STDEV(VLPRECO) AS DECIMAL (20,2)) DESVIO, CAST(VAR(VLPRECO) AS DECIMAL (20,2)) VARIANCIA
FROM IMOVEL

--Selecioando o valor máximo, mínimo total e a média dos valores dos imóveis
SELECT MAX(VLPRECO) MAXIMO, MIN(VLPRECO) MINIMO, SUM(VLPRECO) TOTAL, AVG(VLPRECO) MEDIA
FROM IMOVEL

--Selecioando o valor máximo, mínimo total e a média dos valores dos imóveis e agrupando por bairro
SELECT MAX(VLPRECO) MAXIMO, MIN(VLPRECO) MINIMO, SUM(VLPRECO) TOTAL, AVG(VLPRECO) MEDIA, CDBAIRRO
FROM IMOVEL
GROUP BY CDBAIRRO

--Selecionando o total de imóveis de cada vendedor
SELECT CDVENDEDOR, COUNT(*) TOTAL_DE_IMOVEIS
FROM IMOVEL
GROUP BY CDVENDEDOR
ORDER BY  COUNT(*)

--Fazendo a diferença entre o máximo e o mínimo 
SELECT MAX(VLPRECO) - MIN(VLPRECO) DIFERENÇA
FROM IMOVEL 

--Selecionando o valor mínimo dos ikmoveis de cada vendedor quando o mesmo for maior ou igual a 10 mil
SELECT CDVENDEDOR, MIN(VLPRECO) MENOR_VALOR_IMOVEL
FROM IMOVEL
WHERE VLPRECO >= 10000
GROUP BY CDVENDEDOR

--Selecionando a média e a quantidade de ofertas por comprador
SELECT CDCOMPRADOR, AVG(VLOFERTA), COUNT(*)
FROM OFERTA
GROUP BY CDCOMPRADOR 

--Selecionando o total de ofertas de cada comprador somente nos anos de 2000, 2001 e 2002
SELECT YEAR(DTOFERTA) AS ANO_OFERTA, COUNT(VLOFERTA) AS TOTAL_OFERTAS, CDCOMPRADOR
FROM OFERTA
WHERE YEAR(DTOFERTA) IN (2000, 2001, 2002)
GROUP BY YEAR(DTOFERTA), CDCOMPRADOR;