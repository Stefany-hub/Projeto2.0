create database Projeto_MIT;
use Projeto_MIT;

create table clientes (
idClientes int primary key,
nomeCliente varchar(25),
cnpj varchar(14),
tipo_de_cliente varchar(20)
);

insert into clientes values 
(0101, 'Colepav', 12162177001064, 'Coletores'),
(0102, 'Ecotrans', 08624842000126, 'Coletores'),
(0103, 'Eco Urbis', 7037123000146, 'Coletores'),
(0104, 'Ecobraz', 14197457000142, 'Coletores'),
(0105, 'Parque Ibirapuera', 'Indeterminado', 'Parque'),
(0106, 'Parque Villa Lobos', 'Indeterminado', 'Parque');

create table funcionarios (
idFuncionarios int primary key,
nome varchar(30),
CPF varchar(11),
RG varchar(12),
Telefone1 varchar(11),
Telefone2 varchar(11),
fkClientes2 int,
foreign key (fkClientes2) references clientes (idClientes)
);

insert into funcionarios values 
(0200, 'Manuel Ferreira',573468398, 67598453724, 11958624756, 11978426988, 0101),
(0201, 'João Victor',904735625, 98646529827, 11969735867, 11954326712, 0102),
(0202, 'Laísa Conti',837624416, 37677849567, 11970846978, 11936520887, 0104),
(0203, 'Marcela Sousa',490835542, 38904635287, 11981957089, 11967553287, 0103),
(0204, 'Stefany Batista',296756453, 00467352653, 11925467598, 11956327743, 0105),
(0205, 'Marcelo Oliveira',985674536, 90567747373, 11936578609, 11982437866, 0105),
(0206, 'Lucas Oliveira',748392654, 84940585764, 11947689710, 11955342189, 0101),
(0207, 'Felipe Franco',158935647, 89567483656, 11958790821, 11912650979, 0103),
(0208, 'Gisele Flor',294637377, 90865746534, 11969801932, 11988549076, 0106),
(0209, 'Lucas Matheus',448635424, 46778556463, 11969801932, 11986334544, 0102),
(0210, 'Isabella Silva',289304767, 38940874655, 11970912043, 11966483200, 0106),
(0211, 'Paula Silva',385647357, 46757664533, 11981023154, 11907059923, 0104);

create table EnderecoLix (
idEndereco int Primary key,
Localizacao varchar(25),
Bairro varchar(20),
Cidade varchar(20),
Estado varchar(20)
);
insert into EnderecoLix values
(1000, 'Av. Nações Unidas', 'Jd. Palmares', 'São Paulo', 'SP'),
(1001, 'Rua Benedito Pirucis', 'Jd. Cilda', 'São Paulo', 'SP'),
(1002, 'Av. Pimbadis Violis', 'Jd. Pinheiros', 'São Paulo', 'SP'),
(1003, 'Rua Zike Tuma', 'Jd. Ubirajara', 'São Paulo', 'SP'),
(1004, 'Rua Celma Cruzes', 'Jd. Palmares', 'São Caetano', 'SP'),
(1005, 'Av. Nações Unidas', 'Jd. Palmares', 'São Paulo', 'SP'),
(1006, 'Av. Nações Unidas', 'Jd. Palmares', 'São Paulo', 'SP'),
(1007, 'Parque Ibirapuera', 'Jd. Paulista', 'São Paulo', 'SP'),
(1008, 'Parque Ibirapuera', 'Jd. Paulista', 'São Paulo', 'SP'),
(1009, 'Parque Ibirapuera', 'Jd. Paulista', 'São Paulo', 'SP'),
(1010, 'Parque Villa Lobos', 'Alto de Pinheiros', 'São Paulo', 'SP'),
(1011, 'Parque Villa Lobos', 'Alto de Pinheiros', 'São Paulo', 'SP'),
(1012, 'Parque Villa Lobos', 'Alto de Pinheiros', 'São Paulo', 'SP');

create table statusLixeira (
idStatus int primary key,
Nivel_de_preenchimento int,
Estado_da_lixeira varchar(15),
Dia_e_hora datetime
);

alter table statusLixeira modify Dia_e_hora varchar(20);

insert into statusLixeira values
(2000, 2, 'Médio', '2020/16/03 20:10'), 
(2001, 1, 'Vazio', '2020/12/03 17:40'),
(2002, 2, 'Médio', '2020/19/03 10:15'),
(2003, 3, 'Cheio', '2020/21/03 09:20'),
(2004, 1, 'Vazio', '2020/13/03 05:00'),
(2005, 1, 'Vazio', '2020/11/03 15:10'),
(2006, 3, 'Cheio', '2020/18/03 14:00'),
(2007, 2, 'Médio', '2020/13/03 11:20'),
(2008, 3, 'Cheio', '2020/20/03 16:30'),
(2009, 1, 'Vazio', '2020/19/03 16:00'),
(2010, 3, 'Cheio', '2020/22/03 13:00'),
(2011, 3, 'Cheio', '2020/21/03 15:40'),
(2012, 2, 'Médio', '2020/10/03 18:20');


create table tbLixeira (
idLixeira int primary key,
Data_de_aquisicao date,
Tipo_da_lixeira varchar(20),
fkEndereco int,
foreign key (fkEndereco) references EnderecoLix (idEndereco),
fkStatus int,
foreign key (fkStatus) references statusLixeira (idStatus),
fkClientes int,
foreign key (fkClientes) references clientes (idClientes)
);

alter table tbLixeira modify Data_de_aquisicao varchar(20);

insert into tbLixeira values 
(500, '2020/03/03', 'Papel', 1000, 2000, 0101),
(501, '2020/03/08', 'Plástico', 1001, 2001, 0102),
(502, '2020/03/09', 'Orgânico', 1002, 2002, 0103),
(503, '2020/03/10', 'Vidro', 1003, 2003, 0104),
(504, '2020/03/06', 'Papel', 1004, 2004, 0102),
(505, '2020/03/03', 'Plástico', 1005, 2005, 0101),
(506, '2020/03/03', 'Metal', 1006, 2006, 0101),
(507, '2020/03/07', 'Papel', 1007, 2007, 0105),
(508, '2020/03/07', 'Orgânico', 1008, 2008, 0105),
(509, '2020/03/07', 'Plástico', 1009, 2009, 0105),
(510, '2020/03/02', 'Metal', 1010, 2010, 0106),
(511, '2020/03/02', 'Plástico', 1011, 2011, 0106),
(512, '2020/03/02', 'Papel', 1012, 2012, 0106);




select * from clientes;

select * from funcionarios;

select * from funcionarios, clientes where fkClientes2 = idClientes;

select * from tbLixeira, statusLixeira, EnderecoLix, clientes where idStatus = fkStatus and idEndereco = fkEndereco and idClientes = fkClientes;

