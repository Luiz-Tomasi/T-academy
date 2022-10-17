/* Todas as tabelas deverão disponibilizar comandos completos para: cadastrar,
alterar e remover dados */

#Clientes | Insert | Update | Delete | or
insert into clientes(nome, CPF) values ("Vilson", "122.456.123-25");
select * from clientes where nome = "Vilson";
update clientes set nome = "Moro" where nome = "Vilson";
select * from clientes where nome = "Moro";
delete from clientes where nome = "Moro";
select * from clientes where nome = "Vilson" or nome = "Moro";

#Marcas | Insert | Update | Delete
insert into marcas(nome) values ("Vilson");
select * from marcas where nome = "Vilson";
update marcas set nome = "Moro" where nome = "Vilson";
select * from marcas where nome = "Moro";
delete from marcas where nome = "Moro";
select * from marcas where nome = "Vilson" or nome = "Moro";

#Lojas | Insert | Update | Delete
insert into lojas(nome) values ("Vilson");
select * from lojas where nome = "Vilson";
update lojas set nome = "Moro" where nome = "Vilson";
select * from lojas where nome = "Moro";
delete from lojas where nome = "Moro";
select * from lojas where nome = "Vilson" or nome = "Moro";

#Categorias | Insert | Update | Delete
insert into categorias(nome) values ("Vilson");
select * from categorias where nome = "Vilson";
update categorias set nome = "Moro" where nome = "Vilson";
select * from categorias where nome = "Moro";
delete from categorias where nome = "Moro";
select * from categorias where nome = "Vilson" or nome = "Moro";

#Locacoes | Insert | Update | Delete
delete from lojas where idLoja ="9";
insert into locacoes(endereco, disponivel, idLoja) values ("Z1", "0", "9");
select * from locacoes where endereco = "Z1";
update locacoes set disponivel = 1 where endereco = "Z1";
select * from locacoes where endereco = "Z1";
delete from locacoes where endereco = "Z1";
select * from locacoes where endereco = "Z1";

#cartoes | Insert | Update | Delete
insert into cartoes_loja(idCliente, idLoja, dinheiro) values ("1", "1", "15000");
select * from cartoes_loja where dinheiro = "15000";
update cartoes_loja set dinheiro = "18000" where dinheiro = "15000";
select * from cartoes_loja where dinheiro = "18000";
delete from cartoes_loja where dinheiro = "18000";
select * from cartoes_loja where dinheiro = "18000" or dinheiro = "15000";

#produtos | Insert | Update | Delete
insert into produtos(nome, estoque, idCategoria, idMarca, idLoja) values ("Batata", "3", "1", "1", "1");
select * from produtos where nome = "Batata";
update produtos set nome = "Goiaba" where nome ="Batata";
select * from produtos where nome = "Goiaba";
delete from produtos where nome = "Goiaba";
select * from produtos where nome = "Goiaba" or "Batata";

#carrinhos | Insert | Update | Delete
insert into carrinhos(idProduto, idLoja, IdCliente, estoque) values ("8", "8", "8", "2");
select * from carrinhos where idProduto = "8";
update carrinhos set estoque = "9" where idProduto = "8";
select * from carrinhos where idProduto = "8";
delete from carrinhos where idProduto = "8";
select * from carrinhos where idProduto = "8";