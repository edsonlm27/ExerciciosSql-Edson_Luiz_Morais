-- CREATE DATABASE floricultura
--    WITH
--    OWNER = postgres
--    ENCODING = 'UTF8'
--    CONNECTION LIMIT = -1
--    IS_TEMPLATE = False;


--drop table estado;
create table estado(
	id int primary key,
	nomeEstado varchar(35) not null,
	uf char(2)
);

--drop table cidade;
create table cidade(
	id int primary key,
	nomeCidade varchar(25) not null
);

--drop table rua;
create table rua(
	id int primary key,
	nomeRua varchar(35) not null
);

--drop table endereco;
create table endereco(
	id int primary key,
	cep char(8),
	id_estado int references estado(id),
	id_cidade int references cidade(id),
	id_rua int references rua(id)
);

--drop table telefone;
create table telefone(
	id int primary key,
	numTelef varchar(11)
);

--drop table cliente;
create table cliente(
	id int primary key,
	nome varchar(45),
	rg varchar(10),
	id_telefone int references telefone(id)
);

--drop table produto;
create table produto(
	id int primary key,
	nomeProd varchar(35),
	tipo varchar(15),
	preco real,
	qtEstoque int
);

--drop table compra;
create table compra(
	id int primary key,
	id_cliente int references cliente(id),
	id_produto int references produto(id),
	dataCompra date,
	valorCompra real
);

--drop table prodcompra;
create table prodcompra(
	codprod int references produto(id),
	codcompra int references compra(id)
);
alter table prodcompra add primary key(codprod, codcompra);

--drop table clicompra;
create table clicompra(
	codcli int references cliente(id),
	codcompra int references compra(id)
);
alter table clicompra add primary key(codcli, codcompra);
