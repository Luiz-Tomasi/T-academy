#Trigger para reduzir o estoque do produto quando adicionar ao carrinho| and
delimiter $
create trigger reduzirEstoque 
after insert on carrinhos for each row
begin
	update produtos as p set estoque = estoque - new.estoque where idProduto = new.idProduto and idLoja = new.idLoja;
end $
delimiter ;

select * from produtos;
insert into carrinhos(idProduto, idLoja, idCliente, estoque) values ("1", "1", "1", "2");

#Trigger para aumentar o estoque do produto quando deletar o carrinho|
delimiter $
create trigger aumentarEstoque 
after delete on carrinhos for each row
begin
	update produtos as p set estoque = estoque + old.estoque where idProduto = old.idProduto and idLoja = old.idLoja;
end $
delimiter ;

select * from produtos;
select * from carrinhos;


insert into carrinhos(idCarrinho, idProduto, idLoja, idCliente, estoque) values ("27", "1", "1", "1", "2");
delete from carrinhos where idCarrinho = "27";
