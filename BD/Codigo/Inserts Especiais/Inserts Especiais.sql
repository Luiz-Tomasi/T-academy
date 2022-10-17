#Cliente com menor saldo | min
select cl.nome as nomeCliente, ca.dinheiro as saldo from cartoes_loja as ca inner join clientes as cl on (ca.idCliente = cl.idCliente) where ca.dinheiro = (select min(dinheiro) from cartoes_loja);

#Cliente com saldo entre 500 e 2000 | Between
select cl.nome as nomeCliente, ca.dinheiro as saldo from cartoes_loja as ca inner join clientes as cl on (ca.idCliente = cl.idCliente) where ca.dinheiro between 500 and 2000;

#Cliente com J no nome | Like
select cl.nome as nomeCliente from clientes as cl where cl.nome like "%J%";

#Quantos produtos por marca | HAVING
select count(p.nome), m.nome as nomeMarca from produtos as p inner join marcas as m on (p.idMarca = m.idMarca) group by m.nome having count(p.nome) > 2;