create database sensor;
use sensor;
create table vazio (
idLixo int primary key,
sensor varchar(30)
);
insert into vazio values
(2161, 'Vazio');
create table médio (
idLixo int primary key,
sensor varchar(30)
);
insert into médio values
(2262, 'Médio');
create table cheio (
idLixo int primary key,
sensor varchar(30)
);
insert into cheio values
(2363, 'Cheio');