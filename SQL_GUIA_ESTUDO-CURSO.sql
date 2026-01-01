--Altere o banco de dados para ESTUDO

USE ESTUDOSDATAACADEMY

USE AdventureWorks2017

--Crie sua tabela no banco de dados

CREATE TABLE dbo.DadosPessoais2
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Numero INT NOT NULL UNIQUE CHECK (Numero>0),
    PrimeiroNome VARCHAR(30) NOT NULL,
    Sobrenome VARCHAR(30) NOT NULL,
    Codigo INT DEFAULT 71000,
    Email VARCHAR(50),
    Cidade VARCHAR(50) DEFAULT 'Belo Horizonte'
);

CREATE TABLE dbo.DadosProfissional2
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Numero INT NOT NULL UNIQUE CHECK (Numero>0),
    PrimeiroNome VARCHAR(30) NOT NULL,
    Sobrenome VARCHAR(30) NOT NULL,
    Codigo INT DEFAULT 71000,
    Email VARCHAR(50),
    Cidade VARCHAR(50) DEFAULT 'Belo Horizonte'
);

--Insira dos dados na tabela criada.

INSERT INTO [dbo].[DadosPessoais2]
(Numero,PrimeiroNome,Sobrenome,Codigo,Email,Cidade)

VALUES

(100,'Angel','Biao','010979','agbiao@gmail.com','Sabara'),
(200,'Maria','S Verteiro',default,'masv@gmail.com',default),
(300,'Maria','Balbino',default,'msbfv@gmail.com',default),
(400,'Sham','Fang Ying','418999','123@gmail.com',default),
(500,'Tan','Mei Mei',default,'Teste@gmail.com','Thailand'),
(600,'John','Albert',default,'Teste123@gmail.com',default),
(700,'Adriana','Siqueira','074500','Teste1234@gmail.com',default);

/* CRIAR OUTRA TABELA */

INSERT INTO [dbo].[DadosProfissional2]
(Numero,PrimeiroNome,Sobrenome,Codigo,Email,Cidade)

VALUES

(100,'Fernanda','L Biao','010979','flbiao@gmail.com','Sabara'),
(200,'Maria','S Verteiro',default,'masv@gmail.com',default),
(300,'Maria','Balbino',default,'msbfv@gmail.com',default),
(400,'Sham','Fang Ying','418999','123@gmail.com',default),
(500,'Tan','Mei Mei',default,'Teste@gmail.com','Thailand'),
(600,'John','Albert',default,'Teste123@gmail.com',default);


--Selecione dados existentes em uma tabela.
-- a. Visualize todos as colunas existentes em uma tabela.

SELECT * FROM dbo.DadosPessoais2

SELECT * FROM dbo.DadosProfissional2

-- b. Selecione dados especificos existentes

SELECT Numero, PrimeiroNome, Sobrenome, Email, Cidade
FROM DBO.DadosPessoais2

SELECT PrimeiroNome, Sobrenome
FROM dbo.DadosPessoais2

SELECT PrimeiroNome, Sobrenome, Email
FROM dbo.DadosPessoais2

--Altere a sua tabela adicionando uma coluna

ALTER TABLE dbo.DadosPessoais2
ADD Telefone BIGINT

ALTER TABLE dbo.DadosPessoais2
ALTER COLUMN Sexo VARCHAR(20)

--Adicione valores de dados na sua nova coluna.

/* Adicionar Telefone */

UPDATE dbo.DadosPessoais2 SET Telefone = 1234545346 WHERE Id = 1
UPDATE dbo.DadosPessoais2 SET Telefone = 45554654 WHERE Id = 2
UPDATE dbo.DadosPessoais2 SET Telefone = 8791232587 WHERE Id = 3
UPDATE dbo.DadosPessoais2 SET Telefone = 4561237898 WHERE Id = 4

/* Adicionar Sexo */

UPDATE dbo.DadosPessoais2 SET Sexo = 'Feminino' WHERE Id = 1
UPDATE dbo.DadosPessoais2 SET Sexo = 'Feminino' WHERE Id = 2
UPDATE dbo.DadosPessoais2 SET Sexo = 'Feminino' WHERE Id = 3
UPDATE dbo.DadosPessoais2 SET Sexo = 'Masculino' WHERE Id = 4



--Utilizado para deletar uma coluna existente em uma tabela

ALTER TABLE dbo.DadosPessoais2
DROP COLUMN Sexo

--Utilizado para deletar dados existentes em uma tabela

DELETE
FROM dbo.DadosPessoais2
WHERE Cidade = 'Thailand'


--Utilizado para deletar uma tabela no banco de dados.

DROP TABLE dbo.DadosProfissional2

--Utilizado para alterar uma coluna existente em sua tabela

ALTER TABLE dbo.DadosPessoais2
ALTER COLUMN Telefone VARCHAR(10)

--Utilizado para consultar todas as tabelas disponiveis em um Banco de Dados.

USE ESTUDOSDATAACADEMY
SELECT *
FROM INFORMATION_SCHEMA.TABLES

USE AdventureWorks2017 
SELECT *
FROM INFORMATION_SCHEMA.TABLES

--Utilizada para puxar a quantidade de linhas solicitadas.

USE ESTUDOSDATAACADEMY
SELECT TOP 1 *
FROM dbo.DadosPessoais2


--Comando é utilizado para selecionar e considerar em sua consulta atual apenas os dados validos em banco

USE ESTUDOSDATAACADEMY
SELECT Telefone
FROM dbo.DadosPessoais2 (NOLOCK)


--Uso de As ou Alias permite atruição de nomes ou apelidos

USE ESTUDOSDATAACADEMY
SELECT
    PrimeiroNome AS Nome,Sobrenome AS SegundoNome
FROM dbo.DadosPessoais2 AS DP


--classifica em ordem crescente ou decrescente registros de uma consulta em um ou vários campos especificados

/* ORDENAR PELO NOME A-Z, 0-9 */

USE ESTUDOSDATAACADEMY
SELECT PrimeiroNome, Sobrenome
FROM dbo.DadosPessoais2
ORDER BY PrimeiroNome

/* ORDENAR PELO NOME Z-A, 9-0 */

USE ESTUDOSDATAACADEMY
SELECT PrimeiroNome, Sobrenome
FROM dbo.DadosPessoais2
ORDER BY PrimeiroNome DESC

/* ORDENAR PELO NOME Z-A, 9-0 (utilizando AS ou Alias) */

USE ESTUDOSDATAACADEMY
SELECT PrimeiroNome AS Nome ,Sobrenome
FROM dbo.DadosPessoais2
ORDER BY Nome DESC

/* ORDENAR PELO NOME A-Z, 0-9 (utilizando AS ou Alias) */

USE ESTUDOSDATAACADEMY
SELECT PrimeiroNome AS Nome ,Sobrenome
FROM dbo.DadosPessoais2
ORDER BY Nome


--Exibir apenas linhas distintas

USE ESTUDOSDATAACADEMY
SELECT DISTINCT CODIGO
FROM dbo.DadosPessoais2

--Tabela temporária

/* CRIANDO A TABELA */
USE ESTUDOSDATAACADEMY
SELECT Id, PrimeiroNome AS Nome, SobreNome, Sexo
INTO dbo.Temp
FROM dbo.DadosPessoais2

/* CONSULTANDO A TABELA */
USE ESTUDOSDATAACADEMY
SELECT Id, PrimeiroNome AS Nome, SobreNome, Sexo
INTO #Temp
FROM dbo.DadosPessoais2

SELECT PrimeiroNome, Sobrenome, Email
FROM dbo.DadosPessoais2

--Pesquisar dados nas linhas utilizando um temo especifico em determinada coluna

/* CONSULTA UTILIZANDO LINE */
SELECT * 
    FROM ESTUDOSDATAACADEMY.dbo.DadosPessoais2 
    WHERE Sexo like '%Masculino%'

/* CONSULTA UTILIZANDO IN */
USE ESTUDOSDATAACADEMY
SELECT * 
FROM dbo.DadosPessoais2 
WHERE PrimeiroNome IN ('Angel','Maria')

--Comparando duas expresões iguais

/* MENOR */

USE AdventureWorks2017
SELECT *
FROM [Sales].[SalesPerson]
WHERE Bonus <5000

/* IGUAL */

USE AdventureWorks2017
SELECT *
FROM [Sales].[SalesPerson]
WHERE Bonus =5000

/* MAIOR */

USE AdventureWorks2017
SELECT *
FROM [Sales].[SalesPerson]
WHERE Bonus >1000

--Filtar linhas nulas [BD AdventureWorks2017)

/* CONSULTA INFORMAÇÃO EM UMA COLUNA */
SELECT Name, Weight, Color
FROM Production.Product (NOLOCK)
WHERE Color IS NULL

SELECT Name, Weight, Color
FROM Production.Product (NOLOCK)
WHERE Color IS NOT NULL

--PAREI NA PAGINA 28