--Criando um Banco de Dados

CREATE DATABASE ESTUDOSDATAACADEMY

--Altere o banco de dados para ESTUDO

USE ESTUDOSDATAACADEMY

--Crie sua tabela no banco de dados

CREATE TABLE dbo.DadosPessoais
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Numero INT NOT NULL UNIQUE CHECK (Numero>0),
    PrimeiroNome VARCHAR(30) NOT NULL,
    Sobrenome VARCHAR(30) NOT NULL,
    Codigo INT DEFAULT 71000,
    Email VARCHAR(50),
    Cidade VARCHAR(50) DEFAULT 'Belo Horizonte'
);

CREATE TABLE dbo.DadosProfissional
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

INSERT INTO [dbo].[DadosPessoais]
(Numero,PrimeiroNome,Sobrenome,Codigo,Email,Cidade)

VALUES

(100,'Fernanda','L Biao','010979','flbiao@gmail.com','Sabara'),
(200,'Maria','S Verteiro',default,'masv@gmail.com',default),
(300,'Maria','Balbino',default,'msbfv@gmail.com',default),
(400,'Sham','Fang Ying','418999','123@gmail.com',default),
(500,'Tan','Mei Mei',default,'Teste@gmail.com','Thailand'),
(600,'John','Albert',default,'Teste123@gmail.com',default);

/* INSERIR DADO NA TABELA */
INSERT INTO [dbo].[DadosPessoais]
(Numero,PrimeiroNome,Sobrenome,Codigo,Email,Cidade)

VALUES

(700,'Adriana','Siqueira',074500,'Teste1234@gmail.com',default);

/* CRIAR OUTRA TABELA */

INSERT INTO [dbo].[DadosProfissional]
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

SELECT * FROM dbo.DadosPessoais

SELECT * FROM dbo.DadosProfissional

-- b. Selecione dados especificos existentes

SELECT Numero, PrimeiroNome, Sobrenome, Email, Cidade
FROM DBO.DadosPessoais

SELECT PrimeiroNome, Sobrenome
FROM dbo.DadosPessoais

SELECT PrimeiroNome, Sobrenome, Email
FROM dbo.DadosPessoais

--Altere a sua tabela adicionando uma coluna

ALTER TABLE dbo.DadosPessoais
ADD Telefone BIGINT

ALTER TABLE dbo.DadosPessoais
ADD Sexo BIGINT

--Adicione valores de dados na sua nova coluna.

UPDATE dbo.DadosPessoais SET Telefone = 1234545346 WHERE Id = 1
UPDATE dbo.DadosPessoais SET Telefone = 45554654 WHERE Id = 2
UPDATE dbo.DadosPessoais SET Telefone = 8791232587 WHERE Id = 3
UPDATE dbo.DadosPessoais SET Telefone = 4561237898 WHERE Id = 4

--Utilizado para deletar uma coluna existente em uma tabela

ALTER TABLE dbo.DadosPessoais
DROP COLUMN Sexo

--Utilizado para deletar dados existentes em uma tabela

DELETE
FROM dbo.DadosPessoais
WHERE Cidade = 'Thailand'


--Utilizado para deletar uma tabela no banco de dados.

DROP TABLE dbo.DadosProfissional

--Utilizado para alterar uma coluna existente em sua tabela

ALTER TABLE dbo.DadosPessoais
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
FROM dbo.DadosPessoais


--Comando é utilizado para selecionar e considerar em sua consulta atual apenas os dados validos em banco

USE ESTUDOSDATAACADEMY
SELECT Telefone
FROM dbo.DadosPessoais (NOLOCK)


--Uso de As ou Alias permite atruição de nomes ou apelidos

USE ESTUDOSDATAACADEMY
SELECT
    PrimeiroNome AS Nome,Sobrenome AS SegundoNome
FROM dbo.DadosPessoais AS DP


--classifica em ordem crescente ou decrescente registros de uma consulta em um ou vários campos especificados

/* ORDENAR PELO NOME A-Z, 0-9 */

USE ESTUDOSDATAACADEMY
SELECT PrimeiroNome, Sobrenome
FROM dbo.DadosPessoais
ORDER BY PrimeiroNome

/* ORDENAR PELO NOME Z-A, 9-0 */

USE ESTUDOSDATAACADEMY
SELECT PrimeiroNome, Sobrenome
FROM dbo.DadosPessoais
ORDER BY PrimeiroNome DESC

/* ORDENAR PELO NOME Z-A, 9-0 (utilizando AS ou Alias) */

USE ESTUDOSDATAACADEMY
SELECT PrimeiroNome AS Nome ,Sobrenome
FROM dbo.DadosPessoais
ORDER BY Nome DESC

/* ORDENAR PELO NOME A-Z, 0-9 (utilizando AS ou Alias) */

USE ESTUDOSDATAACADEMY
SELECT PrimeiroNome AS Nome ,Sobrenome
FROM dbo.DadosPessoais
ORDER BY Nome