DROP DATABASE IF EXISTS loja_db;
CREATE DATABASE loja_db;
use loja_db;
CREATE TABLE InfoUsuario (
  cpf varchar(12) NOT NULL,
  cidade varchar(45) NOT NULL,
  bairro varchar(45) NOT NULL,
  rua varchar(45) NOT NULL,
  celular int  NOT NULL,
  PRIMARY KEY (cpf)
);
CREATE TABLE Cliente (
  id_cliente int NOT NULL AUTO_INCREMENT,
  cpf varchar(12) NOT NULL,
  nome varchar(45) NOT NULL,
  PRIMARY KEY (id_cliente),
  FOREIGN KEY (cpf) REFERENCES InfoUsuario(cpf)
);
CREATE TABLE Gerente (
  id_Gerente int NOT NULL AUTO_INCREMENT,
  cpf varchar(12) NOT NULL,
  nome varchar(45) NOT NULL,
  PRIMARY KEY (id_Gerente),
  FOREIGN KEY (cpf) REFERENCES InfoUsuario(cpf)
);
CREATE TABLE Fornecedor (	
	cnpj varchar(19) NOT NULL,
    cpf varchar(12) NOT NULL,
    nome varchar(45) NOT NULL,
    PRIMARY KEY (cnpj)
);
CREATE TABLE Funcionario(
  id_Funcionario int NOT NULL AUTO_INCREMENT,
  cpf varchar(12) NOT NULL,
  nome varchar(45) NOT NULL,
  PRIMARY KEY (id_Funcionario),
	FOREIGN KEY (cpf) REFERENCES InfoUsuario(cpf)
);
CREATE TABLE Produto(
  id_item int NOT NULL AUTO_INCREMENT,
  nome varchar(45) NOT NULL,
  genero char NOT NULL,
  tamanho varchar(4) NOT NULL,
  preco float NOT NULL,
  cnpj_fornecedor varchar(19) NOT NULL,
  PRIMARY KEY (id_item),
  FOREIGN KEY (cnpj_fornecedor) REFERENCES Fornecedor(cnpj)
  
);
CREATE TABLE Pedido(
  id_pedido int NOT NULL AUTO_INCREMENT,
  id_cliente int NOT NULL,
  id_item int NOT NULL,
  quantidade int NOT NULL,
  data_pedido DATE  NOT NULL,
  preco float NOT NULL,
  PRIMARY KEY (id_pedido),
  FOREIGN KEY (id_item) REFERENCES Produto(id_item)
);
CREATE TABLE Loja(
	cnpj varchar(19) NOT NULL,
    nome varchar(50) NOT NULL,
	PRIMARY KEY (cnpj)
);
CREATE TABLE Estoque(
  id int NOT NULL AUTO_INCREMENT,
  local varchar(45) NOT NULL,
  cnpj varchar(19) NOT NULL,
  id_item int NOT NULL,
  descricao varchar(50) NOT NULL,
  data_abastecimento DATE  NOT NULL,
  PRIMARY KEY (id),
	FOREIGN KEY (cnpj) REFERENCES Loja(cnpj),
    FOREIGN KEY (id_item) REFERENCES Produto(id_item)
);
CREATE TABLE Sugestao(
  id_protocolo int NOT NULL AUTO_INCREMENT,
  id_cliente int NOT NULL ,
  email varchar(45) NOT NULL,
  PRIMARY KEY (id_protocolo),
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);
CREATE TABLE Notafiscal(
  id int NOT NULL AUTO_INCREMENT,
  id_item int NOT NULL,
  quantidade int NOT NULL,
  id_Funcionario int NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_item) REFERENCES Produto(id_item),
  FOREIGN KEY (id_Funcionario) REFERENCES Funcionario(id_Funcionario)
);
CREATE TABLE ListaDeVendas(
	c_idgerada int NOT NULL AUTO_INCREMENT,
    id_pedido int NOT NULL,#id_dos pedidos vendidos
    hora TIME NOT NULL,
    status VARCHAR (50) NOT NULL,
	PRIMARY KEY (c_idgerada),
	FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);
#SET FOREIGN_KEY_CHECKS=0; -- Desabilitar Foreign Keys
#SET FOREIGN_KEY_CHECKS=1; -- Habilitando Foreign Keys
#UPDATE EMPREGADO SET supervisor=1 WHERE matricula=2;
#detalhe FK_geralmente é inicializado NULL
