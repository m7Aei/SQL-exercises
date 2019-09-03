create database exercices;
use exercices;

-- Exercício 1

create table if not exists `consultorio` (
  id int auto_increment primary key,
  nome varchar(255) not null,
  endereço varchar(400) not null, 
  telefone varchar(13) not null,
  email varchar(255) not null unique key,
  cidade varchar(30) not null,
  estado varchar(30) not null
) Engine = InnoDB;

-- Exercício 2 

create table if not exists `empresaCheck` (
  id int auto_increment primary key,
  nome varchar(255) not null,
  dataVisita date not null,
  horaEntrega time not null,
  horaSaída time not null,
  departamento varchar(30) not null,
  responsável varchar(255) not null,
  horaMarcada boolean not null
) Engine = InnoDB;

-- Exercício 3 

create table if not exists `loja` (
  id int auto_increment primary key,
  descricao varchar(100) not null,
  tipo varchar(100) not null, 	
  valor_unitario float(6) not null, 	
  unidade varchar(5) not null
) Engine = InnoDB;

-- Exercício 4

alter table `loja` add dataValidade date not null after `unidade`;

-- Exercício 5 

alter table `empresaCheck` drop column `horaMarcada`;

-- Exercício 6

alter table `consultorio` add CEP varchar(13) not null unique key;

-- Exercício 7

select count(*) from `loja`;

-- Exercício 8

alter table `loja` add quantidade int not null after `valor_unitario`;