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

-- Fazendo as consultas no banco de dados
-- 1) Inserir dados na tabela 
-- tabela de estado
insert into estados (nome, sigla) values ('goias', 'go')
insert into estados (nome, sigla) values ('sao paulo', 'sp')
insert into estados (nome, sigla) values ('rio de janeiro', 'rj')
insert into estados (nome, sigla) values ('mato grosso', 'mt')

-- tabela de cidades
insert into cidades (nome, id_estado) VALUES ('goiania', 1);
insert into cidades (nome, id_estado) VALUES ('sao paulo', 2);
insert into cidades (nome, id_estado) VALUES ('rio de janeiro', 3);
insert into cidades (nome, id_estado) VALUES ('cuiaba', 4);

-- tabela de clientes 
insert into clientes (nome, fone, cpf, id_cidade) values ('Mateus', '484', '54', 1);
insert into clientes (nome, fone, cpf, id_cidade) values ('Gui', '484', '54', 2);
insert into clientes (nome, fone, cpf, id_cidade) values ('jef', '484', '54', 3);
insert into clientes (nome, fone, cpf, id_cidade) values ('aa', '484', '54', 4);

-- tabela de vendas 
insert into vendas (valor, data_venda, id_cliente, id_funcionario) values (54, '2001-05-10', 1, 1);
insert into vendas (valor, data_venda, id_cliente, id_funcionario) values (64, '2001-05-10', 2, 2);
insert into vendas (valor, data_venda, id_cliente, id_funcionario) values (214, '2001-05-10', 3, 3);
insert into vendas (valor, data_venda, id_cliente, id_funcionario) values (554, '2001-05-10', 4, 4);

-- tabela de funcionarios
insert into funcionarios (cpf, nome, fone, endereco, id_setor) values ('4123', 'Mateus', '2134', 'ad', 1);
insert into funcionarios (cpf, nome, fone, endereco, id_setor) values ('4123', 'Guilherme', '2134', 'ad', 2);
insert into funcionarios (cpf, nome, fone, endereco, id_setor) values ('4123', 'jef', '2134', 'ad', 3);
insert into funcionarios (cpf, nome, fone, endereco, id_setor) values ('4123', 'leo', '2134', 'ad', 4);

-- tabela setor
insert into setores (nome, sigla) values ('Contas', 'ct');
insert into setores (nome, sigla) values ('vendas', 'vd');
insert into setores (nome, sigla) values ('tecnologia', 'ti');
insert into setores (nome, sigla) values ('suporte', 'spt');

-- tabela funcionario 
insert into fornecedores (nome, contato, email, id_cidade) values ('mateus', 'aa', 'ma@hotmail.com', 1);
insert into fornecedores (nome, contato, email, id_cidade) values ('jed', 'aa', 'jed@hotmail.com', 2);
insert into fornecedores (nome, contato, email, id_cidade) values ('robso', 'aa', 'ro@hotmail.com', 2);
insert into fornecedores (nome, contato, email, id_cidade) values ('julia', 'aa', 'ju@hotmail.com', 3);
insert into fornecedores (nome, contato, email, id_cidade) values ('gui', 'aa', 'gui@hotmail.com', 4);

-- tabela compras
insert into compras (valor, data_compra, id_fornecedor, id_funcionario) values (54, '2001-05-10', 1, 1);
insert into compras (valor, data_compra, id_fornecedor, id_funcionario) values (64, '2001-05-10', 2, 2);
insert into compras (valor, data_compra, id_fornecedor, id_funcionario) values (214, '2001-05-10', 2, 3);
insert into compras (valor, data_compra, id_fornecedor, id_funcionario) values (554, '2001-05-10', 4, 4);

-- tabela dependentes 
insert into dependentes (nome, nascimento, tipo, id_funcionario) values ('mateus', '2001-05-10', 'humano', 1);
insert into dependentes (nome, nascimento, tipo, id_funcionario) values ('gui', '2001-05-10', 'humano', 2);
insert into dependentes (nome, nascimento, tipo, id_funcionario) values ('jef', '2001-05-10', 'humano', 3);
insert into dependentes (nome, nascimento, tipo, id_funcionario) values ('daniel', '2001-05-10', 'humano', 4);

-- 2) Criar uma consulta que mostre o seguinte resultado 
-- | Estado | Sigla | Cidade

select estados.nome, estados.sigla, cidades.nome from estados, cidades;  

-- 3) Criar uma consulta que mostre o seguinte resultado
-- | Nome Cliente | Valor da Venda

select clientes.nome, vendas.valor from vendas inner join clientes on vendas.id_cliente = clientes.id;

-- 4) Mostrar todas as compras do 2° fornecedor cadastrada

select * from compras where compras.id_fornecedor = 2;

-- 5) | Nome Fornecedor | Valor Compra |

select fornecedores.nome, compras.valor from compras inner join fornecedores on compras.id_fornecedor = fornecedores.id;

-- 6) | Nome Funcionario | Nome dependente | Tipo |

select funcionarios.nome, dependentes.nome, dependentes.tipo from dependentes inner join funcionarios on dependentes.id_funcionario = funcionarios.id;
