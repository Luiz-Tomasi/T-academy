#1: Pelo menos três para realizar cadastros
DELIMITER $$
create procedure cadastrarLocacaoLoja(IN endereco varchar(45), IN idLoja int, OUT msg varchar(45))
begin
    
    if isnull(idLoja) then
		set msg = "Precisa selecionar uma loja";
	elseif length(endereco) < 2 then
		set msg = "Endereço inválido";
	elseif (select count(lo.idLoja) from locacoes as lo inner join lojas as l on (lo.idLoja = l.idLoja) where lo.idLoja = idLoja) != 0 then
		set msg = "Loja já alocada";
	else 
		set msg = "Ok";
	end if;
    
    if msg = "Ok" then
		insert into locacoes ( endereco, disponivel, idLoja) values ( endereco, "0", idLoja);
        set msg = "inserido com sucesso";
    end if;
    
	select msg;
END $$
DELIMITER ;

call cadastrarLocacaoLoja("F1", "10", @saida);
select * from locacoes where endereco = "F1";

#2°: Pelo menos três para realizar cadastros
DELIMITER $$
create procedure cadastrarProduto(IN nome varchar(45), IN estoque int, IN idMarca int, IN idLoja int, IN idCategoria int, OUT msg varchar(45))
begin
	
    if (select count(p.nome) from produtos as p inner join marcas as m on (p.idMarca = m.idMarca) inner join lojas as l on (p.idLoja = l.idLoja) inner join categorias as c on (p.idCategoria = c.idCategoria) where p.idMarca = idMarca and p.idLoja = idLoja and p.nome = nome) > 0 then
		set msg = "Produto já cadastrado";
	elseif  estoque < 0 then
		set msg = "Estoque não pode ser negativo";
	else
		set msg ="Ok";
	end if;
    
    if msg = "Ok" then
		insert into produtos (nome, estoque, idMarca, idLoja, idCategoria) values ( nome, estoque, idMarca, idLoja, idCategoria);
        set msg = "inserido com sucesso";
    end if;
    
    select msg;
END $$
DELIMITER ;

call cadastrarProduto("Oi", "8", "3", "3", "1", @saida);
select * from produtos where nome = "Oi";

#3°: Pelo menos três para realizar cadastros
DELIMITER $$
create procedure cadastrarCarrinho(IN idProduto int, IN idLoja int, IN idCliente int, IN estoque int, OUT msg varchar(60))
begin
	if ( select count(*) from carrinhos as ca inner join lojas as l on (ca.idLoja = idLoja) inner join clientes as cl on (ca.idCliente = idCliente) inner join produtos as p on (ca.idProduto = idProduto)) > 0 then
		set msg = "Esse cliente já cadastrou esse produto nessa loja";
	else
		set msg = "Ok";
	end if;
    
    if msg = "Ok" then
		insert into carrinhos (idProduto, idLoja, idCliente, estoque) values (idProduto, idLoja, idCliente, estoque);
        set msg = "inserido com sucesso";
	end if;
    
    select msg;
END $$
DELIMITER ;
drop procedure cadastrarCarrinho;

call cadastrarCarrinho("6", "1", "1", "1", @saida);

