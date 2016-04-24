CREATE OR REPLACE FUNCTION add_eventos( descrip varchar(250), u varchar(250),idcat varchar(8), fcha date, c varchar(80), p varchar(80) ,lat decimal(7,3), longit decimal(7,3)) 
    RETURNS void AS $$
    BEGIN
      INSERT INTO eventos(descripcion, url, idcategoria,fecha, ciudad, pais, latitud, longitud) VALUES (descrip, u, fcha, c, p, lat, longit);
    END;
    $$ LANGUAGE plpgsql;

select*from eventos
select*from categoria
INSERT INTO categoria values('avc', 'AVIACION')
INSERT INTO categoria values('esp', 'ESPACIO')
DROP TABLE solicitud_evt

ALTER TABLE eventos 
drop COLUMN latitud,
drop COLUMN longitud 

ALTER TABLE eventos
ADD COLUMN latitud decimal(7,3) NOT NULL,
ADD COLUMN longitud decimal(7,3) NOT NULL

ALTER TABLE eventos
ADD COLUMN id_evento SERIAL PRIMARY KEY

CREATE TABLE solicitud_evt(
aprobado boolean
) INHERITS(eventos)

DROP TABLE solicitud_evt

select*from localizacion

ALTER TABLE localizacion
DROP COLUMN id_evento

ALTER TABLE localizacion
ADD COLUMN id_evento SERIAL PRIMARY KEY


ALTER TABLE localizacion 
ADD CONSTRAINT fk_eventos 
FOREIGN KEY (id_evento) 
REFERENCES eventos
ON DELETE CASCADE;
