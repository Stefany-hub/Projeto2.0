create database funcionários;
use funcionários;
create table funcionários (
idFuncionarios int primary key,
nome varchar(40),
cargo varchar(50),
empresa varchar(40),
contato char(11)
);
insert into funcionários values
(1512, 'Manuel Ferreira', 'Gerente', 'Colepav', 11958624756),
(1423, 'João Victor', 'Gerente', 'Ecotrans', 11969735867),
(1334, 'Laísa Conti', 'Gerente', 'Eco Urbis', 11970846978),
(1245, 'Marcela Sousa', 'Gerente', 'Ecobraz', 11981957089),
(1256, 'Stefany Batista', 'Recursos Humanos', 'Colepav', 11925467598),
(1067, 'Marcelo Oliveira', 'Recursos Humanos', 'Ecotrans', 11936578609),
(1178, 'Lucas Oliveira', 'Recursos Humanos', 'Eco Urbis', 11947689710),
(1289, 'Felipe Franco', 'Recursos Humanos', 'Ecobraz', 11958790821),
(1390, 'Gisele Flor', 'CTO', 'Colepav', 11969801932),
(2411, 'Lucas Matheus', 'CTO', 'Ecotrans', 11969801932),
(2522, 'Isabella Silva', 'CTO', 'Ecobraz', 11970912043),
(2633, 'Paula Silva', 'CTO', 'Eco Urbis', 11981023154);

