create database if not exists Eventos default character set utf8mb4;
use Eventos;

create table if not exists Participantes(
Num_inscricao INT not null,
CPF varchar(11) not null,
primary key(Num_inscricao,CPF),
nome varchar(50) not null,
data_nasc date not null,
empresa varchar(60) not null );

create table if not exists Locais(
Id_local INT not null primary key,
nome varchar(60) not null,
logradouro varchar(70) not null,
numero INT not null,
bairro varchar(40) not null,
cidade varchar(50) not null,
UF char(2) not null,
CEP varchar(30) not null,
capacidade INT not null );

create table if not exists Eventos(
ID_evento INT not null primary key,
nome varchar(50) not null,
data_evento date not null,
entidade_promotora varchar(45) not null,
locais INT not null,
constraint loc_eve foreign key(locais) references Locais(Id_local) );

create table if not exists Atividades(
Id_atividade INT not null Primary key,
nome_atividade varchar(35) not null,
data_atividade date not null,
hora_atividade time not null,
eventos INT not null,
constraint eve_atv foreign key(eventos) references Eventos(ID_evento) );

create table if not exists Participantes_Eventos(
Inscricao INT not null,
CPF Varchar(11) not null,
Eventos INT not null,
primary key(Inscricao,CPF,Eventos),
constraint PE1 foreign key(Inscricao,CPF) references Participantes(Num_inscricao,CPF),
constraint PE2 foreign key(Eventos) references Eventos(ID_evento) );

create table if not exists Participantes_Atividades(
Inscricao INT not null,
CPF Varchar(11) not null,
Atividades INT not null,
primary key(Inscricao,CPF,Atividades),
constraint PA1 foreign key(Inscricao,CPF) references Participantes(Num_inscricao,CPF),
constraint PA2 foreign key(Atividades) references Atividades(Id_atividade) )