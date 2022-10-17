#1°: inner joins contemplando duas tabelas
create view listarProdutosMarcas as
select p.nome as nomeProduto, l.nome as nomeLoja from produtos as p inner join lojas as l on (p.idLoja = l.idLoja) order by l.nome;
select * from listarProdutosByMarca;

#2°: inner joins contemplando duas tabelas | MAX | Subqueries
create view clienteMaiorSaldo as
select cl.nome as nomeCliente, ca.dinheiro as saldo from cartoes_loja as ca inner join clientes as cl on (ca.idCliente = cl.idCliente) where ca.dinheiro = (select max(dinheiro) from cartoes_loja);
select * from clienteMaiorSaldo;

#1°: inner joins contemplando três tabelas
create view ListarCartoes as 
select cl.nome as nomeCliente, ca.dinheiro as saldo, l.nome as nomeLoja from cartoes_loja as ca inner join clientes as cl on (ca.idCliente = cl.idCliente) inner join lojas as l on (ca.idLoja = l.idLoja);
select * from ListarCartoes;

#inner joins contemplando três tabelas | group by
#Quantidade de produtos de cada categoria de cada marca
create view quantProdutoCategoriaMarca as
select count(p.nome) as quantProduto, cat.nome as nomeCategoria, m.nome as nomeMarca from produtos as p inner join categorias as cat on (p.idCategoria = cat.idCategoria) inner join marcas as m on (p.idMarca = m.idMarca) group by m.nome;
select * from produtoCategoriaMarca;

# 1: inner join contemplando cinco tabelas ou mais
create view registroCarrinho as
select cl.nome as nomeCliente, p.nome as nomeProduto, m.nome as nomeMarca, l.nome as nomeLoja from carrinhos as car inner join clientes as cl on (car.idCliente = cl.idCliente) inner join produtos as p on (car.idProduto = p.idProduto) inner join marcas as m on (p.idMarca = m.idMarca) inner join lojas as l on (car.idLoja = l.idLoja);
select * from registroCarrinho;


#right join
create view listarLojasEndereco as
select l.nome, lo.endereco from locacoes as lo right join lojas as l on (lo.idLoja = l.idLoja) order by lo.endereco;
select * from listarLojasEndereco; #Lista Lojas e Lojas sem endereço

#left join
create view listarEnderecoLojas as
select lo.endereco, l.nome from locacoes as lo left join lojas as l on (lo.idLoja = l.idLoja) order by lo.endereco;
select * from listarEnderecoLojas; #Lista Endereços e endereços sem lojas

