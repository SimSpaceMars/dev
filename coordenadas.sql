-- Database: crops

-- DROP DATABASE crops;
Select*from categoria;
Select*from eventos;
Select*from localizacion;
CREATE TABLE categoria(
idcategoria varchar(8) PRIMARY KEY NOT NULL,
desc_categoria varchar(60) NOT NULL
);
CREATE TABLE eventos(
id_evento varchar(8) PRIMARY KEY NOT NULL,
descripcion varchar(250) NOT NULL,
url varchar(250),
idcategoria varchar(8) NOT NULL,
FOREIGN KEY (idcategoria) REFERENCES categoria(idcategoria)
);
CREATE TABLE localizacion(

cordx decimal(3,2),
cordy decimal(3,2),
id_evento varchar(8) NOT NULL,
FOREIGN KEY (id_evento) REFERENCES eventos(id_evento)

);