CREATE database MIT;
USE MIT;

CREATE TABLE Cliente (
  idCliente INT primary key,
  CNPJ CHAR(13) NULL,
  Nome VARCHAR(45) NULL
  );

CREATE TABLE Endereço (
  idEndereço INT primary key,
  Numero INT NULL,
  CEP CHAR(8) NULL
  );

CREATE TABLE Lixeira (
  idLixeira INT,
  Cliente_idCliente INT,
  IdSensorEntrada CHAR(5),
  IdSensor1 CHAR(5),
  IdSensor2 CHAR(5),
  IdSensor3 CHAR(5),
  primary key (idLixeira,IdSensorEntrada,IdSensor1,IdSensor2, IdSensor3),
  Endereço_idEndereço INT,
  FOREIGN KEY (Cliente_idCliente)REFERENCES Cliente (idCliente),
  FOREIGN KEY (Endereço_idEndereço)REFERENCES Endereço (idEndereço)
);

CREATE TABLE StatusSensor(
  IdMovimentacao INT primary key,
  NivelTotal INT NULL,
  DataHora DATETIME NULL,
  Lixeira_idLixeira INT,
  FOREIGN KEY (Lixeira_idLixeira) REFERENCES Lixeira (idLixeira)
);

