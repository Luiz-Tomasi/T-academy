create database blog;
use blog;

create table Usuario(
idUsuario int primary key auto_increment,
email varchar(45),
senha varchar(45),
moderador tinyInt
);

insert into usuario(email, senha, moderador) values ("email@email.com","senha", "1");
insert into usuario(email, senha, moderador) values ("luiz@email.com","senha", "0"); 
insert into usuario(email, senha, moderador) values ("vilson@email.com","senha", "1"); 
insert into usuario(email, senha, moderador) values ("eu@email.com","senha", "0"); 
insert into usuario(email, senha, moderador) values ("voce@email.com","senha", "1");  

select * from usuario;

create table postagem(
idPostagem int primary key auto_increment,
titulo varchar(45),
texto varchar(500),
idUsuario int,
foreign key (idUsuario) references Usuario(idUsuario)
);
drop table postagem;
insert into postagem(titulo,texto, idUsuario) values ("Algo","AlgumaCoisAlguma AlgumaCoisaAlgumaAlgumaCosaA lgumaAlgumaCoisaAlgaCoisaA lgumaAlgumaCoisaA lgumaAlgumaCoisaAlgumaA lgumaCoisaAlgumaAl gumaCoisaAlgumaAlguma CoisaAlgumaAlgumaCoisaAlgum aAlgumaCoisaAlgumaAlgu maCoisaAlgumaAlgumaCoisaAlgu mAlgumaAlgumaCoisaAlgumaAlgum aCoisaAlgumaAlgumaCoisaAlguma AlgumaCoiumaCoisa
gumaCoiumaAlgumaCoisaAlgu mAlgumaAlgumaCoisaAlgumaAlgum aCoisaAlgumaAlgumaCoisaAlguma AlgumaCoiumaCoisa", 1);
insert into postagem(titulo,texto, idUsuario) values ("Coisa","aCosaA lgumfaefaegaelgumaCoisaAlgumaA lgumaCoisaAlgumaAl gumaCoisaAlgumaAlguma CoisaAlgumaAlgumaCoisaAlgum aAlgumaCoisaAlgumaAlgu maCoisaAlgumaAlgumaCoisaAlgu mAlgumaAlgumaCoisaAlgumaAlgum aCoisaAlgumaAlgumaCoisaAlguma AlgumaCoiumaCoisa
gumaCoiumaAlgumaCoisaAlgu mAlgumaAlgumaCoisaAlgumaAlgum aCoisaAlgumaAlgumaCoisaAlguma AlgumaCoiumaCoisa", 3);
insert into postagem(titulo,texto, idUsuario) values ("Titulo","aCosaA lgumfaefaegaelgumaCoisaAlgumaA lgumaCoisaAlgumaAl gumaCoisaAlgumaAlguma CoisaAlgumaAlgumaCoisaAlgum aAlgumaCoisaAlgumaAlgu maCoisaAlgumaAlgumaCoisaAlgu mAlgumaAlgumaCoisaAlgumaAlgum aCoisaAlgumaAlgumaCoisaAlguma AlgumaCoiumaCoisa
gumaCoiumaAlgumaCoisaAlgu mAlgumaAlgumaCoisaAlgumaAlgum aCoisaAlgumaAlgumaCoisaAlguma AlgumaCoiumaCoisa", 3);

select * from postagem;

select * from postagem where idPostagem = 2;

create table comentario(
idComentario int primary key auto_increment,
comentario varchar(45),
verificado tinyint default 0,
idUsuario int,
idPostagem int,
foreign key (idUsuario) references Usuario(idUsuario),
foreign key (idPostagem) references Postagem(idPostagem)
);

select * from comentario;
select * from comentario where verificado = 0;
update comentario set verificado = '0' where idComentario = '8';
update comentario set verificado = '1' where idComentario = '8';

insert into comentario(comentario, verificado, idUsuario, idPostagem) values ("Jooo f", 0, 1, 1);
insert into comentario(comentario, verificado, idUsuario, idPostagem) values ("Comentario", 1, 1, 1);
insert into comentario(comentario, verificado, idUsuario, idPostagem) values ("Outro Comentario", 1, 3, 2);
select * from Comentario where idPostagem = 10;

select * from postagem order by idPostagem desc limit 10;