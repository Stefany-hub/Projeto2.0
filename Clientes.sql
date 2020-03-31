create database empresas_clientes;
use empresas_clientes;
create table clientes (
idEmpresa int primary key,
nome varchar(40),
cnpj char(14),
tipo_de_empresa varchar(20)
);
insert into clientes values
(0101, 'Colepav', 12162177001064, 'Limitada'),
(0102, 'Ecotrans', 08624842000126, 'Limitada'),
(0103, 'Eco Urbis', 7037123000146, 'Sociedade Anônima'),
(0104, 'Ecobraz', 14197457000142, 'Sociedade Anônima');