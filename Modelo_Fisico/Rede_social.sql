create database if not exists Rede_social default character set utf8mb4;
use Rede_social;
create table if not exists Usuarios(
Id_Usuarios INT not null primary key,
nome varchar(45) not null,
sobrenome varchar(45) not null,
email varchar(45) not null );

create table if not exists Grupos(
id_grupo INT not null primary key,
nome_grupo varchar(50) not null,
descricao text not null );

create table if not exists Postagens(
id_post INT not null primary key,
texto text not null,
imagem blob not null,
data_hora datetime not null,
usuario INT not null,
constraint usu_pos foreign key(usuario) references usuarios(ID_Usuarios) );

create table if not exists Comentarios(
id_comment INT not null primary key,
texto text not null,
data_hora datetime not null,
usuario INT not null,
postagem INT not null,
constraint usu_com foreign key(usuario) references Usuarios(ID_Usuarios),
constraint pos_com foreign key(postagem) references Postagens(id_post) );

create table if not exists Seguidores_Usuarios(
Usuario_Seguidor INT not null,
Usuario_Seguido INT not null,
constraint SU1 foreign key(Usuario_Seguidor) references Usuarios(ID_Usuarios),
constraint SU2 foreign key(Usuario_Seguido) references Usuarios(ID_Usuarios) );

create table if not exists Usuarios_Grupos(
Usuario INT not null,
Grupos INT not null,
constraint UG1 foreign key(Usuario) references Usuarios(ID_Usuarios),
constraint UG2 foreign key(Grupos) references Grupos(id_grupo) )