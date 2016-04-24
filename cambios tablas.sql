ALTER TABLE eventos
ADD column fecha date not null,
ADD column lugar varchar(100) NOT NULL


CREATE TABLE solicitud_evt()INHERITS(eventos);

ALTER TABLE solicitud_evt
ADD COLUMN verificada boolean
