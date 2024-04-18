create schema if not exists Estoque default character set utf8mb4;
use Estoque;

create table if not exists Produtos(
Id_produto INT not null primary key,
nome varchar(45) not null,
descricao text not null,
preco decimal(10,2) not null
);

create table if not exists Fornecedores(
Id_fornecedor INT not null primary key,
CNPJ varchar(20) not null,
nome varchar(45) not null,
cidade varchar(45) not null 
);

create table if not exists Armazens(
Id_armazem INT not null primary key,
nome_armazem varchar(50) not null,
logradouro varchar(70) not null,
numero INT not null,
bairro varchar(60) not null,
cidade varchar(65) not null,
UF char(2) not null 
);

create table if not exists Pedidos_Compra(
id_pedido INT not null primary key,
data_compra date not null,
fornecedores INT not null,
constraint for_ped foreign key(fornecedores) references Fornecedores(ID_fornecedor) );

create table if not exists Produtos_Fornecedores(
Produtos INT not null,
Fornecedor INT not null,
primary key(Produtos,Fornecedor),
constraint PF1 foreign key(Produtos) references Produtos(Id_produto),
constraint PF2 foreign key(Fornecedor) references Fornecedores(Id_fornecedor) );

create table if not exists Produtos_Armazem(
Produtos INT not null,
Armazem INT not null,
primary key(Produtos,Armazem),
constraint PA1 foreign key(Produtos) references Produtos(Id_produto),
constraint PA2 foreign key(Armazem) references Armazens(Id_armazem) )