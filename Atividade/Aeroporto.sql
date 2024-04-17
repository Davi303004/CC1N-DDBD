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
Cod_reserva INT not null,
data_reserva date,
forma_pagamento enum(),
valor_total decimal(10,2) );