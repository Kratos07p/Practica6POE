CREATE DATABASE ClinicaDeAnimales
GO

USE ClinicaDeAnimales
GO

CREATE TABLE Propietarios
(
	id_propietarios INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	nombre_propietario VARCHAR (50) NOT NULL,
	telefono VARCHAR (50) NOT NULL
)
GO

INSERT INTO Propietarios VALUES ('Pablo', 52449102)
INSERT INTO Propietarios VALUES ('Daniel', 28378041)
INSERT INTO Propietarios VALUES ('Martha', 94848722)

UPDATE Propietarios SET nombre_propietario = 'Ixar' WHERE id_propietarios = 1
UPDATE Propietarios SET nombre_propietario = 'Cristian' WHERE id_propietarios = 2
UPDATE Propietarios SET telefono = 73828492 WHERE id_propietarios = 3

SELECT * FROM Propietarios
DELETE FROM Propietarios WHERE id_propietarios = 1

CREATE TABLE Animales
(
	id_animales INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	id_propietario INT FOREIGN KEY REFERENCES Propietarios(id_propietarios),
	nombre_animal VARCHAR (50) NOT NULL,
	edad INT NOT NULL,
	peso DECIMAL NOT NULL
)
GO

INSERT INTO Animales VALUES(1,'Kaiser', 2, 11.9)
INSERT INTO Animales VALUES(2,'Negra', 1, 9.4)
INSERT INTO Animales VALUES(3,'Copito', 5, 20.6)

UPDATE Animales SET nombre_animal = 'Lobo' WHERE id_animales = 1
UPDATE Animales SET id_propietario = 2 WHERE id_animales = 2
UPDATE Animales SET edad = 3 WHERE id_animales = 3

SELECT * FROM Animales
DELETE FROM Animales WHERE id_animales = 2

CREATE TABLE Medicamentos
(
	id_medicamentos INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	nombre_medicamento VARCHAR (100) NOT NULL,
	precio DECIMAL NOT NULL,
	cantidad INT NOT NULL
)
GO

INSERT INTO Medicamentos VALUES('Tetraciclina',1.70,4)
INSERT INTO Medicamentos VALUES('Dipirona',5.80,10)
INSERT INTO Medicamentos VALUES('Aumenta',4.5,7)

UPDATE Medicamentos SET nombre_medicamento = 'Colirio' WHERE id_medicamentos = 1
UPDATE Medicamentos SET precio = 2 WHERE id_medicamentos = 2
UPDATE Medicamentos SET cantidad = 20 WHERE id_medicamentos = 3

SELECT * FROM Medicamentos
DELETE FROM Medicamentos WHERE id_medicamentos = 2

CREATE TABLE Cita
(
	id_cita INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	id_propietario INT FOREIGN KEY REFERENCES Propietarios(id_propietarios),
	id_animales INT FOREIGN KEY REFERENCES Animales(id_animales),
	id_medicamento INT FOREIGN KEY REFERENCES Medicamentos(id_medicamentos),
	fecha DATETIME NOT NULL
)
GO

INSERT INTO Cita VALUES(1,2,3,'2023-09-23 13:00:00')
INSERT INTO Cita VALUES(2,1,1,'2023-10-11 08:00:00')
INSERT INTO Cita VALUES(3,3,2,'2023-10-05 08:00:00')

UPDATE Cita SET id_propietario = 2 WHERE id_cita = 1
UPDATE Cita SET id_animales = 1 WHERE id_cita = 2
UPDATE Cita SET id_medicamento = 3 WHERE id_cita = 3

SELECT * FROM Cita
DELETE FROM Cita WHERE id_cita = 1