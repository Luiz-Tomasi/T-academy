SET FOREIGN_KEY_CHECKS=0; #Permitir manipulação de foreign key
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


#1: Pelo menos três para alterar
DELIMITER $$
create procedure alteraCartao(In idCartao int, IN saldo double, OUT msg varchar(45))
BEGIN
	if saldo < 0 then
		set msg = "A quantia não pode ser negativa";
	else
		set msg = "Ok";
	end if;
    
    if msg = "Ok" then 
		update cartoes_loja as cj set cj.dinheiro = saldo where cj.idCartao = idCartao;
        set msg = "Saldo alterado com sucesso";
	end if;
    
    select msg;
END $$
DELIMITER ;

call alteraCartao("1", "70000", @saida);
select * from cartoes_loja where dinheiro = "70000";

#2: Pelo menos três para alterar # Prenche uma vaga vazia 
DELIMITER $$ 
create procedure alteraLocacao(In endereco varchar(45), IN idLoja int, OUT msg varchar(45))

BEGIN
	declare id int;
	if (select count(l.nome) from locacoes as lo inner join lojas as l on (lo.idLoja = idLoja) where isnull(lo.idLoja)) > 0 then
		set msg = "Loja já alocada";
	elseif (select count(lo.endereco) from locacoes as lo where lo.endereco = endereco and disponivel = 0) > 0 then
		set msg = "Endereço já esta em uso";
	else
		set msg = "Ok";
	end if;
    
    if msg = "Ok" then
		set id = (select lo.idLocacao from locacoes as lo where lo.endereco = endereco);
		update locacoes as lo set lo.idLoja = "33" and disponivel = 0 where lo.idLocacao = id;
		set msg = "Alterado com sucesso";
	end if;
    
    select msg;
END $$
DELIMITER ;

insert into lojas values ("53", "NovaLoja");
call alteraLocacao("B3", "53", @saida);
select * from locacoes;

#3: Pelo menos três para alterar
DELIMITER $$ 
create procedure alteraCategoria(In idCategoria int, IN nomeCategoria varchar(45), OUT msg varchar(45))
BEGIN
	if length(nomeCategoria) > 5 then
		update categorias as ca set ca.nome = nomeCategoria where ca.idCategoria = idCategoria;
        set msg = "Categoria Alterada com sucesso";
	else
		set msg = "Nome muito pequeno";
	end if;
    
    select msg;
END $$
DELIMITER ;

select * from categorias;
call alteraCategoria("5", "Social", @saida);

#1: Pelo menos três para deletar
DELIMITER $$ 
create procedure deletaCategoria(In idCategoria int, OUT msg varchar(45))
BEGIN
		delete from categorias as ca where ca.idCategoria = idCategoria;
        set msg = "Categoria deletada com sucesso";
    
    select msg;
END $$
DELIMITER ;

call deletaCategoria("5", @saida);
select * from categorias;

#2: Pelo menos três para deletar
DELIMITER $$ 
create procedure deletaMarca(In idMarca int, OUT msg varchar(45))
BEGIN
		delete from marcas as m where m.idMarca = idMarca;
        set msg = "Marca deletada com sucesso";
    
    select msg;
END $$
DELIMITER ;

#3: Pelo menos três para deletar
DELIMITER $$ 
create procedure deletaCliente(In idCLiente int, OUT msg varchar(45))
BEGIN
		delete from clientes as cl where cl.idCliente = idCliente;
        set msg = "Cliente deletado com sucesso";
    
    select msg;
END $$
DELIMITER ;

call deletaCliente("5", @saida);
select * from clientes;


#Adicionar nova Marca
DELIMITER $$ 
create procedure createMarca(In nomeMarca varchar(45), OUT msg varchar(45))
BEGIN
		if (select count(m.nome) from marcas as m where m.nome = nomeMarca) > 1 then
			set msg = "Marca já cadastrada";
		else
			insert into marcas(nome) values (nomeMarca);
            set msg = "Marca cadastrada com sucesso";
		end if;
        
    select msg;
END $$
DELIMITER ;


call createMarca("MarcaNova", @saida);
select * from marcas where nome = "MarcaNova";

