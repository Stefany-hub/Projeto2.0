create database site_pluralidade;
use site_pluralidade;

create table login (
id_login int primary key auto_increment,
usuario varchar (30),
senha char(8)
);

insert into login values 
(null,'Fernando','12345678');
