create database importancia;
use importancia;
create table importancia (
idCargo int primary key,
nome varchar(40),
cargo varchar(50),
situação varchar(30)
);
insert into importancia values
(5261, 'Gisele Flor', 'CTO', 'Tem Acesso'),
(5362, 'Lucas Matheus', 'CTO', 'Tem Acesso'),
(5463, 'Isabella Silva', 'CTO', 'Tem Acesso'),
(5564, 'Paula Silva', 'CTO', 'Tem Acesso');