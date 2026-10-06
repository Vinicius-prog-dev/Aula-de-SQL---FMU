-- 1. Força o uso do banco de dados Aula1
USE Aula1;

-- ============================================================
-- PARTE 1: TABELA AGENDA
-- ============================================================

-- Remove a tabela agenda anterior para recriar do zero
IF OBJECT_ID('Aula1.dbo.agenda', 'U') IS NOT NULL 
    DROP TABLE Aula1.dbo.agenda;

-- Criação da Tabela agenda
CREATE TABLE Aula1.dbo.agenda (
   id       INT         NOT NULL,
   nome     VARCHAR(50) NOT NULL,
   dt_nasc  DATE        NOT NULL,
   telefone VARCHAR(30)     NULL,
   email    VARCHAR(30) NOT NULL
);

-- Inserções na Tabela agenda (Datas no padrão YYYY-MM-DD)
INSERT INTO Aula1.dbo.agenda 
   VALUES (1, 'Vinicius', '2005-12-13', '11958366139', 'vinigaloa@gmail.com');

INSERT INTO Aula1.dbo.agenda (id, nome, dt_nasc, telefone, email) 
   VALUES (2, 'Jose', '2005-12-13', '11958366139', 'vinigaloa@gmail.com');

INSERT INTO Aula1.dbo.agenda (id, nome, dt_nasc, telefone, email) 
   VALUES (3, 'Pedro', '2005-11-17', '11999995', 'pedrolopes@gmail.com');

INSERT INTO Aula1.dbo.agenda (id, nome, dt_nasc, telefone, email) 
   VALUES (4, 'Eduardo', '2007-11-12', '11988888', 'eduardorocha@gmail.com');

INSERT INTO Aula1.dbo.agenda (id, nome, dt_nasc, telefone, email) 
   VALUES (5, 'Gustavo', '2005-11-28', '119888877', 'gustavooliveira@gmail.com');

-- Consultas na Tabela agenda
SELECT * FROM Aula1.dbo.agenda;

SELECT nome, dt_nasc, email FROM Aula1.dbo.agenda;

SELECT nome, dt_nasc, email FROM Aula1.dbo.agenda ORDER BY nome ASC;

SELECT nome, dt_nasc, email FROM Aula1.dbo.agenda WHERE nome = 'Vinicius';

SELECT nome, dt_nasc, email FROM Aula1.dbo.agenda WHERE nome <> 'Vinicius';

SELECT nome, dt_nasc, email FROM Aula1.dbo.agenda WHERE dt_nasc > '2005-12-13';

-- Remoção e checagem
DELETE FROM Aula1.dbo.agenda WHERE id = 1;

SELECT * FROM Aula1.dbo.agenda WHERE id = 1;

SELECT DISTINCT * FROM Aula1.dbo.agenda;


-- ============================================================
-- PARTE 2: TABELA PESSOA
-- ============================================================

-- Remove tabelas Pessoa antigas tanto do banco Aula1 quanto do master
IF OBJECT_ID('Aula1.dbo.Pessoa', 'U') IS NOT NULL 
    DROP TABLE Aula1.dbo.Pessoa;

IF OBJECT_ID('master.dbo.Pessoa', 'U') IS NOT NULL 
    DROP TABLE master.dbo.Pessoa;

-- Criação da Tabela Pessoa
CREATE TABLE Aula1.dbo.Pessoa (
   ID_pes      INTEGER NOT NULL,
   pes_nome    VARCHAR(50) NOT NULL,
   pes_salario DECIMAL(8,2) NULL
);

-- Inserções na Tabela Pessoa
INSERT INTO Aula1.dbo.Pessoa (ID_pes, pes_nome, pes_salario) VALUES (1, 'Ana', 100.00);
INSERT INTO Aula1.dbo.Pessoa (ID_pes, pes_nome, pes_salario) VALUES (2, 'Paulo', 200.00);
INSERT INTO Aula1.dbo.Pessoa (ID_pes, pes_nome, pes_salario) VALUES (3, 'João', NULL);
INSERT INTO Aula1.dbo.Pessoa (ID_pes, pes_nome, pes_salario) VALUES (4, 'Antonio', 100.00);

-- Consulta na Tabela Pessoa
SELECT * FROM Aula1.dbo.Pessoa;

SELECT avg(pes_salario)
	FROM Pessoa ; --> 133,333
	
	SELECT sum(pes_salario)
	FROM pessoa; --> 400,00
	
	SELECT min(pes_salario)
	FROM pessoa; --> 100,00
	
	SELECT max(pes_salario)
	FROM pessoa; --> 200,00
	
	SELECT count(pes_salario)
	FROM pessoa; --> 3
	
	SELECT count(ID_pes)
	FROM pessoa; --> 4

	SELECT count(*)
	FROM pessoa; --> 4
	
	SELECT count(distinct pes_salario)
	FROM pessoa; --> 2 (de 100,00)
	
	-- calcular media sem o avg()
	SELECT sum(pes_salario) / count(pes_salario)
	FROM pessoa;
	
	-- arrendondando com dois digitos depois da virgula 
	SELECT ROUND(SUM)(pes_salario) / COUNT(pes_salario), 2)
		FROM pessoa;
	
CREATE TABLE Departamento (
   ID_depto      INTEGER     NOT NULL,
   depto_nome    VARCHAR(50) NOT NULL,
   depto_cidade  VARCHAR(40) NOT NULL,
   depto_uf      CHAR(2)     NOT NULL
);

CREATE TABLE Funcionarios (
   ID_fun           INTEGER        NOT NULL,
   fun_nome         VARCHAR(50)     NOT NULL,
   fun_cargo        VARCHAR(50)     NOT NULL,
   fun_dta_contrato DATE            NOT NULL,
   fun_salario      DECIMAL(8,2)    NOT NULL,
   fun_comm         DECIMAL(8,2),
   ID_depto INTEGER NOT NULL
);

-- insert funcionário
INSERT INTO Funcionarios
(ID_fun, fun_nome, fun_cargo, fun_dta_contrato, fun_salario, fun_comm, id_depto)
VALUES(7369, 'ANA MARIA', 'ATENDENTE', '17/12/1980', 1800.00, 0, 20);

INSERT INTO Funcionarios
(ID_fun, fun_nome, fun_cargo, fun_dta_contrato, fun_salario, fun_comm, id_depto)
VALUES(7499, 'HERNANDEZ', 'VENDEDOR', '20/02/1981', 1800.00, 0, 30);

INSERT INTO Funcionarios
(ID_fun, fun_nome, fun_cargo, fun_dta_contrato, fun_salario, fun_comm, id_depto)
VALUES(7521, 'WILLIAN',	'VENDEDOR', '22/02/1981', 3800.00, 1250.00, 30);

INSERT INTO Funcionarios
(ID_fun, fun_nome, fun_cargo, fun_dta_contrato, fun_salario, fun_comm, id_depto)
VALUES(7566, 'JOÃO SALDANHA', 'GERENTE', '02/04/1981', 10000.00, 0, 20);

INSERT INTO Funcionarios
(ID_fun, fun_nome, fun_cargo, fun_dta_contrato, fun_salario, fun_comm, id_depto)
VALUES(7654, 'MARIANA', 'VENDEDOR', '28/09/1988', 4300.00, 0, 30);

INSERT INTO Funcionarios
(ID_fun, fun_nome, fun_cargo, fun_dta_contrato, fun_salario, fun_comm, id_depto)
VALUES(7698, 'BRUNO', 'GERENTE', '01/05/1997', 10000.00, 0, 30);

INSERT INTO Funcionarios
(ID_fun, fun_nome, fun_cargo, fun_dta_contrato, fun_salario, fun_comm, id_depto)
VALUES(7782, 'CLARICE', 'GERENTE', '09/06/2001', 10000.00, 0, 10);

INSERT INTO Funcionarios
(ID_fun, fun_nome, fun_cargo, fun_dta_contrato, fun_salario, fun_comm, id_depto)
VALUES(7788, 'SANDRA', 'ANALISTA', '09/12/2004', 8500.00, 0, 20);

INSERT INTO Funcionarios
(ID_fun, fun_nome, fun_cargo, fun_dta_contrato, fun_salario, fun_comm, id_depto)
VALUES(7839, 'ROBERT', 'CEO', '17/11/1979', 45000.00, 0, 10);

INSERT INTO Funcionarios
(ID_fun, fun_nome, fun_cargo, fun_dta_contrato, fun_salario, fun_comm, id_depto)
VALUES(7844, 'DANIEL', 'VENDEDOR', '08/09/1981', 3200.00, 0, 30);

INSERT INTO Funcionarios
(ID_fun, fun_nome, fun_cargo, fun_dta_contrato, fun_salario, fun_comm, id_depto)
VALUES(7878, 'AMANDA', 'ATENDENTE', '12/01/1983', 1100.00, 0, 20);

INSERT INTO Funcionarios
(ID_fun, fun_nome, fun_cargo, fun_dta_contrato, fun_salario, fun_comm, id_depto)
VALUES(7900, 'JAIME', 'ATENDENTE', '03/12/1985', 1299.00, 0, 30);

INSERT INTO Funcionarios
(ID_fun, fun_nome, fun_cargo, fun_dta_contrato, fun_salario, fun_comm, id_depto)
VALUES(7902, 'FRANCISCO', 'ANALISTA', '03/12/1985', 8500.00, 0, 20);

INSERT INTO Funcionarios
(ID_fun, fun_nome, fun_cargo, fun_dta_contrato, fun_salario, fun_comm, id_depto)
VALUES(7934, 'MURILO', 'ATENDENTE', '23/01/1982', 1300.00, 0, 10);

select * from Funcionarios;		

-- insert departamentos 
INSERT INTO Departamento
(ID_depto, depto_nome, depto_cidade, depto_uf)
VALUES(10, 'CONTABILIDADE', 'SÃO PAULO', 'SP');

INSERT INTO Departamento
(ID_depto, depto_nome, depto_cidade, depto_uf)
VALUES(20, 'TI', 'FLORIANOPOLIS', 'SC');

INSERT INTO Departamento
(ID_depto, depto_nome, depto_cidade, depto_uf)
VALUES(30, 'VENDAS', 'CURITIBA', 'PR');

INSERT INTO Departamento
(ID_depto, depto_nome, depto_cidade, depto_uf)
VALUES(40, 'OPERAÇÃO', 'RECIFE', 'PE');
	
select * from Departamento;	

  JOIN
