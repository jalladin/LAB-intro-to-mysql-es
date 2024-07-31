Entidades y Atributos:

Coches

ID (INT, AUTO_INCREMENT, PRIMARY KEY)
VIN (VARCHAR(17), NOT NULL)
Fabricante (VARCHAR(50), NOT NULL)
Modelo (VARCHAR(50), NOT NULL)
Año (YEAR, NOT NULL)
Color (VARCHAR(30), NOT NULL)
Clientes

ID (INT, AUTO_INCREMENT, PRIMARY KEY)
ClienteID (INT, NOT NULL)
Nombre (VARCHAR(100), NOT NULL)
Teléfono (VARCHAR(20), NULL)
Correo (VARCHAR(100), NULL)
Dirección (VARCHAR(100), NULL)
Ciudad (VARCHAR(50), NULL)
Estado/Provincia (VARCHAR(50), NULL)
País (VARCHAR(50), NULL)
Código Postal (VARCHAR(10), NULL)
Vendedores

ID (INT, AUTO_INCREMENT, PRIMARY KEY)
PersonalID (INT, NOT NULL)
Nombre (VARCHAR(100), NOT NULL)
Tienda (VARCHAR(100), NOT NULL)
Facturas

ID (INT, AUTO_INCREMENT, PRIMARY KEY)
Número de Factura (VARCHAR(20), NOT NULL)
Fecha (DATE, NOT NULL)
CocheID (INT, FOREIGN KEY REFERENCES Coches(ID))
ClienteID (INT, FOREIGN KEY REFERENCES Clientes(ID))
VendedorID (INT, FOREIGN KEY REFERENCES Vendedores(ID))

Relaciones:

Un coche puede estar asociado con múltiples facturas (1
).
Un cliente puede tener múltiples facturas (1
).
Un vendedor puede estar asociado con múltiples facturas (1
).


DESAFIO 2.
    
USE lab_mysql;

CREATE TABLE Coches (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17) NOT NULL,
    Fabricante VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Año YEAR NOT NULL,
    Color VARCHAR(30) NOT NULL
);

CREATE TABLE Clientes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Teléfono VARCHAR(20),
    Correo VARCHAR(100),
    Dirección VARCHAR(100),
    Ciudad VARCHAR(50),
    EstadoProvincia VARCHAR(50),
    País VARCHAR(50),
    CódigoPostal VARCHAR(10)
);

CREATE TABLE Vendedores (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    PersonalID INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Tienda VARCHAR(100) NOT NULL
);

CREATE TABLE Facturas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NúmeroFactura VARCHAR(20) NOT NULL,
    Fecha DATE NOT NULL,
    CocheID INT,
    ClienteID INT,
    VendedorID INT,
    FOREIGN KEY (CocheID) REFERENCES Coches(ID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID),
    FOREIGN KEY (VendedorID) REFERENCES Vendedores(ID)

DESAFIO 3.
USE lab_mysql;

INSERT INTO Coches (VIN, Fabricante, Modelo, Año, Color) VALUES
('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Azul'),
('ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Rojo'),
('RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'Blanco'),
('HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Plata'),
('DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gris'),
('DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gris');

INSERT INTO Clientes (ClienteID, Nombre, Teléfono, Correo, Dirección, Ciudad, EstadoProvincia, País, CódigoPostal) VALUES
(10001, 'Pablo Picasso', '+34 636 17 63 82', NULL, 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'España', '28045'),
(20001, 'Abraham Lincoln', '+1 305 907 7086', NULL, '120 SW 8th St', 'Miami', 'Florida', 'Estados Unidos', '33130'),
(30001, 'Napoléon Bonaparte', '+33 1 79 75 40 00', NULL, '40 Rue du Colisée', 'París', 'Île-de-France', 'Francia', '75008');

INSERT INTO Vendedores (PersonalID, Nombre, Tienda) VALUES
(00001, 'Petey Cruiser', 'Madrid'),
(00002, 'Anna Sthesia', 'Barcelona'),
(00003, 'Paul Molive', 'Berlín'),
(00004, 'Gail Forcewind', 'París'),
(00005, 'Paige Turner', 'Miami'),
(00006, 'Bob Frapples', 'Ciudad de México'),
(00007, 'Walter Melon', 'Ámsterdam'),
(00008, 'Shonda Leer', 'São Paulo');

INSERT INTO Facturas (NúmeroFactura, Fecha, CocheID, ClienteID, VendedorID) VALUES
('852399038', '2018-08-22', 0, 1, 3),
('731166526', '2018-12-31', 3, 0, 5),
('271135104', '2019-01-22', 2, 2, 7);


    