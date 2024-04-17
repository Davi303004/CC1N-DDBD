create schema if not exists Hospital default character set utf8mb4;

create table if not exists Pacientes(
CPF_Paciente Varchar(15) not null primary key,
nome varchar(50) not null,
data_nasc Date not null,
telefone varchar(45) not null,
email varchar(45) not null);

create table if not exists Departamentos(
cod_Especialidade INT not null primary key,
nome_Especialidade varchar(50) not null );

create table if not exists Medicos(
CRM INT not null auto_increment,
UF char(2) not null auto_increment,
nome varchar(50) not null,
email varchar(50) not null,
telefone varchar(30) not null,
departamento INT not null,
primary key(CRM,UF,departamento),
constraint dep_med foreign key(departamento) references departamentos(cod_Especialidade) );

create table if not exists Consultas(
Id_Consultas INT not null auto_increment,
Anamnese text not null,
data_cons date not null,
hora time not null,
CRM INT not null,
UF char(2) not null,
Paciente varchar(15) not null,
constraint med_cons foreign key(CRM,UF) references Medico(CRM,UF),
constraint Pac_cons foreign key(Paciente) references Pacientes(CPF_Paciente),
primary key(Id_Consultas,CRM,UF,Paciente) )