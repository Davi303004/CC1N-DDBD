create schema if not exists Aeroporto default character set utf8mb4;
use Aeroporto;
create table if not exists Passageiros(
Cod_passageiro varchar(15) not null primary key,
nome varchar(20) not null,
sobrenome varchar(50) not null,
data_nasc date not null,
nacionalidade varchar(45) );

create table if not exists CIA_Aereas(
id_cia INT not null primary key,
nome varchar(60) not null,
CNPJ varchar(30) not null );

create table if not exists Reservas(
Cod_reservas INT not null primary key,
data_reserva date not null,
forma_pagamento enum("dinheiro","crédito","débito","PIX"),
valor_total decimal(10,2) );

create table if not exists Aeronave(
Cod_aeronave INT not null primary key,
modelo varchar(50) not null,
fabricante varchar(45) not null,
ano year,
quantidade_assentos INT,
CIA_Aerea INT not null,
constraint cia_nave foreign key(CIA_Aerea) references CIA_Aereas(id_cia) );

create table if not exists Aeroportos(
cod_aeroporto varchar(4) not null primary key,
pais varchar(40) not null,
cidade varchar(45) not null,
estado varchar(50) not null,
rua varchar(55) not null,
num_rua INT not null,
logradouro varchar(70) not null
);

create table if not exists Voos(
Id_Voo INT not null,
Assento Varchar(50) not null,
primary key(Id_Voo,Assento),
data_partida date not null,
data_chegada_prev date not null,
hora_partida time not null,
hora_chegada_prev time not null,
Aeronave INT not null,
Aeroporto_Chegada varchar(4) not null,
Aeroporto_Partida varchar(4) not null,
constraint nave_voo foreign key(Aeronave) references Aeronave(Cod_aeronave),
constraint che_voo foreign key(Aeroporto_Chegada) references Aeroportos(cod_aeroporto),
constraint par_voo foreign key(Aeroporto_Partida) references Aeroportos(cod_aeroporto) );

create table if not exists Passageiros_Reservas(
passageiros varchar(15) not null,
reservas INT not null,
primary key(passageiros,reservas),
constraint pas_res foreign key(passageiros) references Passageiros(Cod_passageiro),
constraint res_pas foreign key(reservas) references Reservas(Cod_reservas) );

create table if not exists Voos_Reservas(
voo INT not null,
assento varchar(50) not null,
reserva INT not null,
primary key(voo,assento,reserva),
constraint voo_res foreign key(voo,assento) references Voos(Id_Voo, Assento),
constraint res_voo foreign key(reserva) references Reservas(Cod_reservas)
 );