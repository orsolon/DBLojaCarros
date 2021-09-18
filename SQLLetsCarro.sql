CREATE DATABASE LetsCarros
USE LetsCarros

CREATE TABLE Marca
(
	Id INT IDENTITY NOT NULL,
	NomeMarca VARCHAR(20) NOT NULL,
	CONSTRAINT PK_Marca PRIMARY KEY (Id)
)

CREATE TABLE Cor
(
	Id INT IDENTITY NOT NULL,
	NomeCor VARCHAR(20),
	CONSTRAINT PK_Cor PRIMARY KEY (Id)
)

CREATE TABLE Modelo
(
	Id INT IDENTITY NOT NULL,
	Modelo VARCHAR (20) NOT NULL,
	CONSTRAINT PK_Modelo PRIMARY KEY (Id)
)

CREATE TABLE ModalidadePagamento
(
	Id INT IDENTITY NOT NULL,
	FormaDePagamento VARCHAR NOT NULL,
	CONSTRAINT PK_ModalidadePagamento PRIMARY KEY (Id)
)

ALTER TABLE ModalidadePAgamento
DROP COLUMN FormaDePagamento;

ALTER TABLE ModalidadePAgamento
	ADD FormaDePagamento VARCHAR(40);

ALTER TABLE ModalidadePagamento
	ADD Valor MONEY

ALTER TABLE ModalidadePagamento
DROP COLUMN Valor;

CREATE TABLE Adicionais
(
	Id INT IDENTITY NOT NULL,
	Descricao VARCHAR(40) NOT NULL,
	CONSTRAINT PK_Descricao PRIMARY KEY (Id)
)



CREATE TABLE Carro
(
	Id INT IDENTITY NOT NULL,
	IdMarca INT NOT NULL,
	IdModelo INT NOT NULL,
	IdCor INT NOT NULL,
	IdAdicionais INT NOT NULL,
	Ano SMALLINT NOT NULL,
	Valor MONEY NOT NULL,
	CONSTRAINT PK_Carro PRIMARY KEY (Id),
	CONSTRAINT FK_Carro_Marca
	FOREIGN KEY (IdMarca)
	REFERENCES Marca(Id),
	CONSTRAINT FK_Carro_Modelo
	FOREIGN KEY (IdModelo)
	REFERENCES Modelo(Id),
	CONSTRAINT FK_Carro_Cor
	FOREIGN KEY (IdCor)
	REFERENCES Cor(Id),

)

ALTER TABLE Carro
DROP COLUMN IdAdicionais;

sp_help carro

ALTER TABLE Orders
DROP CONSTRAINT FK_Carro_Modalidade;


CREATE TABLE AdicionaisCarro
(
	Id INT IDENTITY NOT NULL,
	IdAdicionais INT NOT NULL,
	IdCarro INT NOT NULL,
	CONSTRAINT PK_AdicionaisCarro PRIMARY KEY (Id),
	CONSTRAINT FK_Adiconais_Carro
	FOREIGN KEY (IdAdicionais)
	REFERENCES Adicionais(Id),
	CONSTRAINT FK_CarroJoinAdicionais
	FOREIGN KEY (IdCarro)
	REFERENCES Carro(Id)
)

CREATE TABLE ModalidadePgto_Carro
(
	Id INT IDENTITY NOT NULL,
	IdCarro INT NOT NULL,
	IdModalidadePgto INT NOT NULL,
	CONSTRAINT PK_ModalidadePgto_Carro PRIMARY KEY (Id),
	CONSTRAINT FK_Pgto_Carro
	FOREIGN KEY (IdModalidadePgto)
	REFERENCES ModalidadePagamento(Id),
	FOREIgn KEY (IdCarro)
	REFERENCES Carro(Id)

)

CREATE TABLE ClienteTipo
(
	Id INT IDENTITY NOT NULL,
	Tipo CHAR(2) NOT NULL,
	CONSTRAINT PK_ClienteTipo PRIMARY KEY (Id)

)

CREATE TABLE Usuario
(
	Id INT IDENTITY NOT NULL,
	NomeUsuario VARCHAR(60) NOT NULL,
	CONSTRAINT PK_Usuario PRIMARY KEY (Id)
)

CREATE TABLE Contato
(
	Id INT IDENTITY NOT NULL,
	IdTelefone INT NOT NULL,
	IdEmail INT NOT NULL ,
	IdEndereco INT NOT NULL,
	CONSTRAINT PK_Contato PRIMARY KEY (Id),
	CONSTRAINT FK_Contato_Telefone
	FOREIGN KEY (IdTelefone)
	REFERENCES Telefone(Id),
	CONSTRAINT FK_Contato_Email
	FOREIGN KEY (IdEmail)
	REFERENCES Email(Id),
	CONSTRAINT FK_Contato_Endereco
	FOREIGN KEY (IdEndereco)
	REFERENCES Endereco(Id),

)

CREATE TABLE Email
(
	Id INT IDENTITY NOT NULL,
	EMail_1 VARCHAR(60) NOT NULL,
	Email_2 VARCHAR(60)
	CONSTRAINT PK_Email PRIMARY KEY (Id)
)

CREATE TABLE Telefone
(
	Id INT IDENTITY NOT NULL,
	TelefoneCelular INT ,
	TelefoneResidencial INT,
	TelefoneAlternativo INT
	CONSTRAINT PK_Telefone PRIMARY KEY (Id)
)

ALTER TABLE Telefone
	ADD TelefoneAlternativo VARCHAR(40);

CREATE TABLE Endereco
(
	Id INT IDENTITY NOT NULL,
	Logradouro VARCHAR(60) NOT NULL,
	Numero INT,
	Cep VARCHAR(10),
	Cidade VARCHAR(20),
	UF CHAR(2)
	CONSTRAINT PK_Endereco PRIMARY KEY (Id)
)

CREATE TABLE Cliente
(
	Id INT IDENTITY NOT NULL,
	IdContato INT NOT NULL,
	IdFavorito INT NOT NULL,
	IdTipoCliente INT NOT NULL,
	Nome VARCHAR(30) NOT NULL,
	Sobrenome VARCHAR(60) NOT NULL,
	DataNascimento DATE,
	CONSTRAINT PK_Cliente PRIMARY KEY (Id),
	CONSTRAINT FK_Cliente_Contato
	FOREIGN KEY (IdContato)
	REFERENCES Contato(Id),
	CONSTRAINT FK_Cliente_TipoCliente
	FOREIGN KEY (IdTipoCliente)
	REFERENCES ClienteTipo(Id),

)

ALTER TABLE Cliente
DROP COLUMN IdFavorito;

CREATE TABLE Favorito
(
	Id INT IDENTITY NOT NULL,
	IdCliente INT NOT NULL,
	IdCarro INT NOT NULL,
	CONSTRAINT PK_Favorito PRIMARY KEY (Id),
	CONSTRAINT FK_Favorito_Cliente
	FOREIGN KEY (IdCliente)
	REFERENCES Cliente(Id),
	FOREIGN KEY (IdCarro)
	REFERENCES Carro(Id)
)

CREATE TABLE Formulario
(
	Id INT IDENTITY NOT NULL,
	IdCarro INT NOT NULL,
	Nome VARCHAR(60),
	Mensagem VARCHAR(120),
	Data DATETIME NOT NULL,
	CONSTRAINT PK_Formulario PRIMARY KEY (Id)
)

INSERT INTO Adicionais(Descricao)
	VALUES('Vidro Eletrico'),
			('Ar Condicionado'),
			('Cambio Automatico'),
			('Direção Hidráulica'),
			('Multimidia'),
			('Câmera de ré')

SELECT * FROM Adicionais

INSERT INTO ModalidadePagamento(FormaDePagamento)
	VALUES ('Cartão de Crédito'),
			('Cartão de Débito'),
			('Pix'),
			('Boleto'),
			('Transferencia Bancária'),
			('Dinheiro')
		
SELECT * FROM ModalidadePagamento

INSERT INTO Cor(NomeCor)
	VALUES ('Preto'),
			('Branco'),
			('Cinza'),
			('Prata'),
			('Azul'),
			('Especial')

SELECT * FROM Cor

INSERT INTO Marca(NomeMarca)
	VALUES ('Fiat'),
			('Ford'),
			('Jeep'),
			('Volkswagen'),
			('Toyota'),
			('Honda')

SELECT * FROM Marca

INSERT INTO Modelo(Modelo)
	VALUES ('Uno'),
			('Ranger'),
			('Renegade'),
			('Gol'),
			('Corola'),
			('Compass'),
			('Rav'),
			('EcoSport'),
			('Palio'),
			('Up')

SELECT * FROM Modelo

INSERT INTO ClienteTipo(Tipo)
	VALUES('PF'),
			('PJ')

INSERT INTO Usuario(NomeUsuario)
	VALUES('Laura Maria'),
			('Lucas'),
			('Luan')

INSERT INTO Endereco(Logradouro, Numero, Cep, Cidade, UF)
	VALUES('Rua Turiassu', 20, '01151-000', 'São Paulo', 'SP'),
			('Rua Marta', 322, '02001-222', 'São Paulo', 'SP'),
			('Rua Sete', 543, '03440-111', 'Campinas', 'SP')

INSERT INTO Telefone(TelefoneCelular, TelefoneResidencial, TelefoneAlternativo)
	VALUES(96699440, 3443090, null),
			(954559, 3333004, null)

INSERT INTO Email(EMail_1, Email_2)
	VALUES('fulano@gmail.com', 'teste@teste.com.br'),
			('ciclano@gmail.com', null)

INSERT INTO Contato(IdTelefone, IdEmail, IdTelefone)
	VALUES(1, 1, 1)

SELECT * FROM Adicionais

INSERT INTO Carro(IdMarca, IdModelo, IdCor, Ano, Valor)
	VALUES(3,3,1,2021,90.000)

sp_help carro

INSERT INTO AdicionaisCarro(IdAdicionais, IdCarro)
	VALUES(7, 8)

SELECT * FROM ModalidadePagamento


INSERT INTO ModalidadePgto_Carro(IdModalidadePgto, IdCarro)
	VALUES (4,6),
	(2,7),
	(3,8)

SELECT * FROM Cliente
sp_help Telefone

INSERT INTO Contato(IdTelefone, IdEmail, IdEndereco)
	VALUES(1,1,3),
		(2,2,2)

INSERT INTO Cliente(IdContato, IdTipoCliente, Nome, Sobrenome, DataNascimento)
	VALUES(2,1,'Mauricio', 'Lazaro', '1980-12-04')

INSERT INTO Favorito(IdCliente, IdCarro)
	VALUES(2,6),
		(3,8)

ALTER TABLE Formulario
	ADD Email VARCHAR(40)

INSERT INTO Formulario(IdCarro, Nome, Mensagem, Data, Email)
	VALUES(8, 'Luciana', 'gostaria de informaçoes sobre o estado desse veiculo',GETDATE(), 'lu@gmail.com')



--INSERT CLIENTE

GO
CREATE PROCEDURE InsertCliente
@IdContato INT,
@IdTipoCliente INT,
@Nome VARCHAR(30),
@Sobrenome VARCHAR (60),
@DataNascimento DATE
AS
BEGIN
INSERT INTO Cliente (IdContato, IdTipoCliente, Nome, Sobrenome, DataNascimento)
	VALUES(@IdContato, @IdContato, @Nome, @Sobrenome, @DataNascimento)
END

-- Insert Carro
GO
CREATE PROCEDURE InsertCarro
@IdMarca INT,
@IdModelo INT,
@IdCor INT,
@Ano SMALLINT,
@Valor MONEY
AS
BEGIN
INSERT INTO Carro(IdMarca, IdModelo, IdCor, Ano, Valor)
	VALUES(@IdMarca, @IdMarca, @IdCor, @Ano, @Valor)
END


-- Exclusão cLIENTE
GO
CREATE PROCEDURE ExcluirCliente
@id INT
AS
BEGIN
DELETE FROM Cliente WHERE Id = @Id
END

-- Exclusão carro
GO
CREATE PROCEDURE ExcluirCarro
@id INT
AS
BEGIN
DELETE FROM Carro WHERE Id = @Id
END

-- UPDATE CLIENTE

GO
CREATE PROCEDURE EditarCliente
@Id INT,
@IdContato INT,
@IdTipoCliente INT,
@Nome VARCHAR(30),
@Sobrenome VARCHAR (60),
@DataNascimento DATE
AS
BEGIN
UPDATE Cliente 
SET
	IdContato = @IdContato, 
	IdTipoCliente = @IdTipoCliente, 
	Nome = @Nome, 
	Sobrenome = @Sobrenome, 
	DataNascimento = @DataNascimento
	WHERE
	Id = @Id
END

-- UPDATE CARRO

GO
CREATE PROCEDURE EditarCarro
@Id INT,
@IdMarca INT,
@IdModelo INT,
@IdCor INT,
@Ano SMALLINT,
@Valor MONEY
AS
BEGIN
UPDATE  Carro
	SET
	IdMarca = @IdMarca, 
	IdModelo = @IdModelo, 
	IdCor = @IdCor, 
	Ano = @Ano, 
	Valor = @Valor
	WHERE
	Id = @Id
END

-- SELECTS

GO
CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Cliente
GO;


GO
CREATE PROCEDURE FilterCarrosPreco @valor MONEY
AS
SELECT * FROM Carro WHERE Valor < @valor
GO;



GO
CREATE PROCEDURE QuantidadeCarrosMarca
@IdMarca INT
AS
SELECT IdMarca
COUNT(*)
FROM Carro
GROUP BY IdMarca = @IdMarca
GO;

GO
CREATE PROCEDURE MediaPrecoCarros
AS
SELECT 
AVG(Valor)
FROM Carro
GO;

GO
CREATE PROCEDURE MenorPrecoCarros
AS
SELECT 
MIN(Valor)
FROM Carro
GO;

GO
CREATE PROCEDURE MaiorPrecoCarros
AS
SELECT 
Max(Valor)
FROM Carro
GO;

GO
CREATE PROCEDURE SelectFavoritos
AS
BEGIN
SELECT 
	u.Nome,
	m.Modelo
FROM Favorito f
	INNER JOIN Carro c
		on c.Id = f.IdCarro
	INNER JOIN Cliente u
	on u.Id = f.IdCliente
	INNER JOIN Modelo m
	on m.Id = c.IdModelo
END