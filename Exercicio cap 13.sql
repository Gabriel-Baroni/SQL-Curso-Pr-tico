--Usando o banco de dados criado
USE ImovelNet

--Criando um login chamado LOJA
CREATE LOGIN LOJA
WITH PASSWORD = 'LOJA';

--Dando permição de conexão ao banco de dados
GRANT CONNECT TO LOJA;

--Dando permissão de ler as entidades COMPRADOR e VENDEDOR
GRANT SELECT ON COMPRADOR TO LOJA 
GRANT SELECT ON VENDEDOR TO LOJA 

--Dando permissão de inserir e atualizar as entidades OFERTA e IMOVEL 
GRANT INSERT, UPDATE ON OFERTA TO LOJA 
GRANT INSERT, UPDATE ON IMOVEL TO LOJA 

--Dando permissão de deletar as entidades CIDADE, ESTADO e BAIRRO
GRANT DELETE ON CIDADE TO LOJA 
GRANT DELETE ON ESTADO TO LOJA 
GRANT DELETE ON BAIRRO TO LOJA 

--Revogando permissão de deletar as entidades CIDADE, ESTADO e BAIRRO
REVOKE DELETE ON CIDADE TO LOJA 
REVOKE DELETE ON ESTADO TO LOJA 
REVOKE DELETE ON BAIRRO TO LOJA 

--Mudando o isolamento dass transições para em série
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE 

--Fazendo as CONSTRAINTS serem lidas no final das transações 
SET CONSTRAINT ALL DEFERRED 