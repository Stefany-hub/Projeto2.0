create database ProjetoMIT;
use ProjetoMIT;

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
(1006, 'Parque Ibirapuera', 'Jd. Paulista', 'São Paulo', 'SP'),
(1007, 'Parque Villa Lobos', 'Alto de Pinheiros', 'São Paulo', 'SP');


create table sensorEntrada(
idEntrada varchar(20) primary key,
Unidade_Armazenadas int,
Dia_e_hora datetime
);

insert into sensorEntrada values 
('SE01', 10, '2020-04-16 20:10:00'),
('SE02', 4, '2020-04-12 17:40:00'),
('SE03', 9, '2020-04-19 10:15:00'),
('SE04', 17,'2020-04-01 09:20:00'),
('SE05', 5, '2020-04-13 05:00:00'),
('SE06', 5,'2020-04-11 15:10:00'),
('SE07', 24, '2020-04-18 14:00:00'),
('SE08', 12, '2020-04-12 20:20:00'),
('SE09', 19, '2020-04-20 16:30:00'),
('SE10', 3, '2020-04-19 16:00:00'),
('SE11', 21, '2020-04-22 13:00:00'),
('SE12', 21, '2020-04-21 15:40:00'),
('SE13', 13, '2020-04-10 18:20:00');

create table SVazio (
idSensorV varchar(20) primary key,
movimento char(1),
check (movimento = 1 or movimento = 0),
Data_Hora datetime
);

insert into SVazio values 
('S1', 1, '2020-04-16 20:10:00'),
('S4', 0, '2020-04-12 17:40:00'),
('S7', 1, '2020-04-19 10:15:00'), 
('S10', 1, '2020-04-01 09:20:00'),
('S13', 1, '2020-04-13 05:00:00'),
('S16', 1, '2020-04-11 15:10:00'),
('S19', 1, '2020-04-18 14:00:00'),
('S22', 1, '2020-04-12 20:20:00'),
('S25', 1, '2020-04-20 16:30:00'),
('S28', 0, '2020-04-19 16:00:00'),
('S31', 1, '2020-04-22 13:00:00'),
('S34', 1, '2020-04-21 15:40:00'),
('S37', 1, '2020-04-10 18:20:00');

create table SMedio (
idSensorM varchar(20) primary key,
movimento char(1),
check (movimento = 1 or movimento = 0),
Data_Hora datetime
);

insert into SMedio values 
('S2', 1, '2020-04-16 20:10:00'),
('S5', 0, '2020-04-12 17:40:00'),
('S8', 0, '2020-04-19 10:15:00'), 
('S11', 1, '2020-04-01 09:20:00'),
('S14', 0, '2020-04-13 05:00:00'),
('S17', 0, '2020-04-11 15:10:00'),
('S20', 1, '2020-04-18 14:00:00'),
('S23', 1, '2020-04-12 20:20:00'),
('S26', 1, '2020-04-20 16:30:00'),
('S29', 0, '2020-04-19 16:00:00'),
('S32', 1, '2020-04-22 13:00:00'),
('S35', 1, '2020-04-21 15:40:00'),
('S38', 1, '2020-04-10 18:20:00');

create table SCheio (
idSensorC varchar(20) primary key,
movimento char(1),
check (movimento = 1 or movimento = 0),
Data_Hora datetime
);

insert into SCheio values 
('S3', 0, '2020-04-16 20:10:00'),
('S6', 0, '2020-04-12 17:40:00'),
('S9', 0, '2020-04-19 10:15:00'), 
('S12', 0, '2020-04-01 09:20:00'),
('S15', 0, '2020-04-13 05:00:00'),
('S18', 0, '2020-04-11 15:10:00'),
('S21', 1, '2020-04-18 14:00:00'),
('S24', 0, '2020-04-12 20:20:00'),
('S27', 1, '2020-04-20 16:30:00'),
('S30', 0, '2020-04-19 16:00:00'),
('S33', 1, '2020-04-22 13:00:00'),
('S36', 1, '2020-04-21 15:40:00'),
('S39', 0, '2020-04-10 18:20:00');



create table tbLixeira (
idLixeira int primary key,
Tipo_da_lixeira varchar(20),
fkEndereco int,
foreign key (fkEndereco) references EnderecoLix (idEndereco),
fkClientes int,
foreign key (fkClientes) references clientes (idClientes),
fkEntrada varchar(20),
foreign key (fkEntrada) references SensorEntrada (idEntrada),
fkSensorV varchar(20),
foreign key (fkSensorV) references SVazio (idSensorV),
fkSensorM varchar(20),
foreign key (fkSensorM) references SMedio (idSensorM),
fkSensorC varchar(20),
foreign key (fkSensorC) references SCheio (idSensorC)
);


insert into tbLixeira values 
(500, 'Papel', 1000, 0101, 'SE01', 'S1', 'S2', 'S3'),
(501, 'Plástico', 1001, 0102, 'SE02', 'S4', 'S5', 'S6'),
(502, 'Orgânico', 1002, 0103, 'SE03', 'S7', 'S8', 'S9'),
(503, 'Vidro', 1003, 0103, 'SE04', 'S10','S11','S12'),
(504, 'Papel', 1004, 0104, 'SE05', 'S13','S14','S15'),
(505, 'Plástico', 1002, 0101, 'SE06', 'S16','S17','S18'),
(506, 'Metal', 1003, 0102, 'SE07', 'S19','S20','S21'),
(507, 'Papel', 1004, 0104, 'SE08', 'S22','S23','S24'),
(508, 'Orgânico', 1005, 0103, 'SE09', 'S25','S26','S27'),
(509, 'Plástico', 1006, 0105, 'SE10', 'S28','S29','S30'),
(510, 'Metal', 1007, 0106, 'SE11', 'S31','S32','S33'),
(511, 'Plástico', 1006, 0105, 'SE12', 'S34','S35','S36'),
(512, 'Papel', 1007, 0106, 'SE13', 'S37','S38','S39');




select * from clientes;

select * from funcionarios;


select * from tbLixeira, sensorEntrada, SVazio, SMedio, SCheio where idEntrada = fkEntrada and idSensorV = fkSensorV and idSensorM = fkSensorM and idSensorC = fkSensorC;
