create database OS;

use OS;

create table cliente(
id int primary key not null,
nome varchar(100) not null,
endereco varchar(100),
cpf varchar(20),
cidade varchar(100),
telefone varchar(30) not null
);

create table mecanico(
id int primary key not null,
nome varchar(100) not null,
endereco varchar(100),
cpf varchar(20),
cidade varchar(100),
telefone varchar(30) not null
);

create table veiculo(
id int primary key not null,
descricao_veiculo varchar(100),
placa varchar(30),
ano_modelo varchar(30),
id_cliente int,
foreign key (id_cliente) references cliente(id)
);

create table marca(
id int primary key not null,
nome varchar(100)
);

create table pecas(
id int primary key not null,
descricao varchar(100),
preco double(12,2),
id_marca int,
foreign key (id_marca) references marca(id)
);

create table servicos(
id int primary key not null,
descricao_servico varchar(100),
valor_servico double(12,2)
);

create table os(
id int primary key not null,
numero_os varchar(10) not null,
data_abertura_os date not null,
data_encerramento_os date not null,
valor_total double(12,2) not null,
id_mecanico int not null,
id_cliente int not null, 
id_veiculo int not null,
foreign key (id_mecanico) references mecanico(id),
foreign key (id_cliente) references cliente(id),
foreign key (id_veiculo) references veiculo(id)
);

create table os_pecas(
id int primary key not null,
id_pecas int,
id_os int,
foreign key (id_pecas) references pecas(id),
foreign key (id_os) references os(id)
);

create table os_servicos(
id int primary key not null,
id_servicos int,
id_os int,
foreign key (id_servicos) references servicos(id),
foreign key (id_os) references os(id)
);