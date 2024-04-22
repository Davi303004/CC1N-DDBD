create database if not exists Financias default character set utf8mb4;
use Financias;

create table if not exists Usuarios(
Id_usuarios INT not null primary key,
nome_Completo varchar(100) not null,
CPF varchar(15) not null,
email varchar(45) not null,
telefone varchar(15) not null,
data_nasc date not null );

create table if not exists Transacoes(
Id_transacoes INT not null primary key,
valor decimal(10,2) not null,
natureza enum("disponibilidade no exterior","manutenção de residentes","compra e venda de imoveis"),
usuarios INT not null,
constraint usu_tra foreign key(usuarios) references Usuarios(Id_usuarios) );

create table if not exists Contas(
Agencia varchar(10) not null,
conta varchar(15) not null,
Cod_banco INT not null,
primary key(Agencia, conta, Cod_banco),
nome_banco varchar(50) not null,
end_agencia varchar(60) not null,
bairro_agencia varchar(50) not null,
cidade_agencia varchar(50) not null,
UF_agencia char(2) not null,
telefone varchar(15) not null,
email varchar(45) not null,
tipo_conta enum("conjunta","corrente","poupança"),
transacoes INT not null,
usuarios INT not null,
constraint tra_con foreign key(transacoes) references Transacoes(Id_transacoes), 
constraint usu_con foreign key(usuarios) references Usuarios(Id_usuarios) );

create table if not exists Saldos(
data_saldos INT not null,
valor decimal(10,2) not null,
agencia varchar(10) not null,
conta varchar(15) not null,
banco INT not null,
constraint con_sal foreign key(agencia, conta, banco) references Contas(Agencia, Conta, Cod_banco) )