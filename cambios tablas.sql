ALTER TABLE eventos
ADD column latitud decimal(3,2) NOT NULL,
ADD column longitud decimal(3,2) NOT NULL,
ADD column fecha date not null,
ADD column ciudad varchar(80) NOT NULL,
ADD column pais varchar(80) NOT NULL


CREATE TABLE solicitud_evt()INHERITS(eventos);

ALTER TABLE solicitud_evt
ADD COLUMN verificada boolean

select*from eventos
select*from solicitud_evt