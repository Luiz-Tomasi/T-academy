create database t_academy;
use t_academy;


create table lojas (
idLoja int primary key auto_increment,
nome varchar(45)
);

create table locacoes (
idLocacao int primary key auto_increment,
endereco varchar(45),
disponivel tinyint default 1,
idLoja int unique,
foreign key (idLoja) references lojas(idLoja)
); 

create table marcas(
idMarca int primary key auto_increment,
nome varchar(45)
);

create table categorias(
idCategoria int primary key auto_increment,
nome varchar(45)
);

create table produtos (
idProduto int primary key auto_increment,
nome varchar(45),
estoque int,
idMarca int,
idLoja int,
idCategoria int,
foreign key(idCategoria) references categorias(idCategoria),
foreign key(idMarca) references marcas(idMarca),
foreign key(idLoja) references lojas(idLoja)
);

create table clientes (
idCliente int primary key auto_increment,
nome varchar(45),
cpf varchar(14) unique
);

create table cartoes_loja (
idCartao int primary key auto_increment,
idCliente int,
idLoja int,
dinheiro float,
foreign key(idCliente) references clientes(idCliente),
foreign key(idLoja) references lojas(idLoja)
);

create table carrinhos (
idCarrinho int primary key auto_increment,
Estoque int,
idProduto int,
idLoja int,
idCliente int,
foreign key(idProduto) references produtos(idProduto),
foreign key(idLoja) references lojas(idLoja),
foreign key(idCliente) references clientes(idCliente)
);

insert into clientes(nome, CPF) values ("João", "123.456.123-25"), ("Maria", "987.654.321-11"), ("Luiz", "123.321.231-00"), ("Roberto", "765.432.123-00"), ("Roberta", "654.321.213-99"), ("Joana", "000.984.953-77"), ("Jorge", "231.444.332-55"), ("Felipe", "111.111.111-11"), ("Theo", "222.222.222-22"), ("Bernardo", "333.333.333-33");
select * from clientes;
insert into marcas(nome) values ("Marca0"),("Marca1"),("Marca2"),("Marca3"),("Marca4"),("Marca5"),("Marca6"),("Marca7"),("Marca8"),("Marca9");
select * from marcas;
insert into lojas(nome) values ("Loja0"),("Loja1"),("Loja2"),("Loja3"),("Loja4"),("Loja5"),("Loja6"),("Loja7"),("Loja8"),("Loja9");
select * from lojas;
insert into locacoes(endereco, disponivel, idLoja) values ("A1", "0", "1"), ("A2", "0", "2"), ("A3", "1", null), ("B1", "0", "3"), ("B2", "0", "4"), ("B3", "1", null), ("C1", "0", "5"), ("C2", "0", "6"), ("C3", "1", null), ("D1", "0", "7"), ("D2", "0", "8"), ("D3", "1", null);
select * from locacoes;
insert into categorias(nome) values ("lacticinios"), ("roupas"), ("calçados"), ("frios"), ("Categoria0"), ("Categoria1"), ("Categoria2"), ("Categoria3"), ("Categoria4"), ("Categoria5");
select * from categorias;
insert into produtos(nome, estoque, idCategoria, idMarca, idLoja) values ("Manteiga", "3", "1", "1", "1"), ("Leite", "5", "1", "1", "1"), ("Queijo", "3", "1", "1", "1"), ("Manteiga", "3", "1", "3", "4"), ("Leite", "5", "1", "3", "4"), ("Queijo", "3", "1", "3", "4"),  ("Calça", "7", "2", "5", "5"), ("Camiseta", "5", "2", "5", "5"), ("Bermuda", "8", "2", "5", "5"), ("Sapato", "9", "3", "9", "9");
select * from produtos;
insert into cartoes_loja(idCliente, idLoja, dinheiro) values ("1", "1", "1000"), ("2", "1", "2000"), ("1", "2", "3000"), ("2", "2", "2000"), ("3", "1", "1000"), ("4", "1", "2000"), ("3", "2", "3000"), ("4", "2", "2000"),  ("6", "2", "3000"), ("7", "2", "2000");
select * from cartoes_loja;
insert into carrinhos(idProduto, idLoja, IdCliente, estoque) values ("1", "1", "1", "2"), ("2", "2", "2", "2"), ("3", "3", "3", "2"), ("4", "4", "4", "2"), ("5", "5", "5", "2"), ("2", "8", "6", "2"), ("4", "1", "1", "2"), ("2", "3", "1", "2"), ("6", "4", "2", "2"), ("1", "2", "3", "2");
select * from carrinhos;