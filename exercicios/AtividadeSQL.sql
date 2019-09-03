-- Criando a database 
create database AtividadeSQL;

-- Usando a database 
use AtividadeSQL;

-- Criando a tabela de estado
create table if not exists `estados` (
  `id` integer primary key auto_increment,
  `nome` varchar(255) not null,
  `sigla` varchar(5) not null
) Engine= innodb;

-- Criando a tabela de cidades
create table if not exists `cidades` (
  `id` integer primary key auto_increment,
  `nome` varchar(255) not null,
  `id_estado` integer not null
) Engine = innodb;

-- Criando a tabela de clientes
create table if not exists `clientes` (
  `id` integer primary key auto_increment,
  `nome` varchar(255) not null,
  `endereco` varchar(300),
  `fone` varchar(16) not null,
  `cpf` varchar(11) not null,
  `id_cidade` integer not null
) Engine = innodb;

-- Criando a tabela de fornecedores
create table if not exists `fornecedores` (
  `id` integer primary key auto_increment,
  `nome` varchar(255) not null,
  `fone` varchar(16),
  `contato` varchar(255) not null,
  `email` varchar(255) not null,
  `id_cidade` integer not null
) Engine = innodb;

-- Criando a tabela de vendas
create table if not exists `vendas` (
  `id` integer primary key auto_increment,
  `valor` double not null,
  `valor_pago` double,
  `data_venda` date not null,
  `data_pagamento` date,
  `id_cliente` integer not null,
  `id_funcionario` integer not null
) Engine = innodb;

-- Criando a tabela de compras
create table if not exists `compras` (
  `id` integer primary key auto_increment,
  `valor` double not null,
  `valor_pago` double,
  `data_compra` date not null,
  `data_pagamento` date,
  `id_fornecedor` integer not null,
  `id_funcionario` integer not null
) Engine = innodb;

-- Criando a tabela de funcionários
create table if not exists `funcionarios` (
  `id` integer primary key auto_increment,
  `cpf` varchar(11) not null,
  `nome` varchar(255) not null,
  `fone` varchar(16) not null,
  `email` varchar(300),
  `endereco` varchar(300) not null,
  `salario` double,
  `id_setor` integer not null
) Engine = innodb;

-- Criando a tabela de dependentes
create table if not exists `dependentes` (
  `id` integer primary key auto_increment,
  `nome` varchar(255) not null,
  `nascimento` date not null,
  `tipo` varchar(120) not null,
  `id_funcionario` integer not null
) Engine = innodb;

-- Criando a tabela de setores
create table if not exists `setores` (
  `id` integer primary key auto_increment,
  `nome` varchar(255) not null,
  `sigla` varchar(5) 
) Engine = innodb;

-- Adicionando a chave estrangeira na tabela de cidades
alter table `cidades` add constraint fk_Estado foreign key (`id_estado`) references `estados` (`id`);

-- Adicionando a chave estrangeira na tabela de clientes
alter table `clientes` add constraint fk_Cidade foreign key (`id_cidade`) references `cidades` (`id`);

-- Adicionando a chave estrangeira na tabela de fornecedores
alter table `fornecedores` add constraint fk_City foreign key (`id_cidade`) references `cidades` (`id`);

-- Adicionando as chaves estrangeiras na tabela de vendas
alter table `vendas` add constraint fk_Clientes foreign key (`id_cliente`) references `clientes` (`id`);
alter table `vendas` add constraint fk_Funcionarios foreign key (`id_funcionario`) references `funcionarios` (`id`);

-- Adicionando as chaves estrangeiras na tabela de compras
alter table `compras` add constraint fk_Fornecedores foreign key (`id_fornecedor`) references `fornecedores` (`id`);
alter table `compras` add constraint fk_Funcionario foreign key (`id_funcionario`) references `funcionarios` (`id`);

-- Adicionando a chave estrangeira na tabela de funcionários
alter table `funcionarios` add constraint fk_Setor foreign key (`id_setor`) references `setores` (`id`);

-- Adicionando a chave estrangeira na tabela de dependentes
alter table `dependentes` add constraint fk_Funcionarioss foreign key (`id_funcionario`) references `funcionarios` (`id`);