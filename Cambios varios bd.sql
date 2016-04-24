
CREATE OR REPLACE FUNCTION add_eventos( descrip varchar(250), u varchar(250),idcat varchar(8), fcha date, c varchar(80), p varchar(80) ,lat decimal(7,3), longit decimal(7,3)) 
    RETURNS void AS $$
	DECLARE id_e INTEGER;
    BEGIN
      INSERT INTO eventos(descripcion, url, idcategoria, fecha, ciudad, pais, latitud, longitud) 
      VALUES (descrip, u, idcat,fcha, c, p, lat, longit) RETURNING id_evento INTO id_e;
      INSERT INTO localizacion values(lat, longit, id_e);
    END;
    $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION show_points() RETURNS refcursor AS $$
    DECLARE
      ref refcursor;
    BEGIN
      OPEN ref FOR SELECT localizacion.cordx, localizacion.cordy, eventos.descripcion, eventos.fecha, eventos.idcategoria, eventos.ciudad, eventos.pais, eventos.url 
      FROM localizacion INNER JOIN eventos ON localizacion.id_evento=eventos.id_evento;
      RETURN ref;
    END;
    $$ LANGUAGE plpgsql;


SELECT show_points();



BEGIN;
 
   SELECT show_points();
   -- Returns: <unnamed portal 2>
 
   FETCH ALL IN "<unnamed portal 5>";
COMMIT;CREATE TABLE localizacion(
cordx decimal(7,3) NOT NULL,
cordy decimal(7,3) NOT NULL,
id_evento integer
);


    
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

SELECT show_points();
SELECT add_eventos('METEORITO NICARAGUA', 'NINGUNO', 'esp', '14/03/2015', 'MANAGUA', 'NICARAGUA', -86.3502, 12.0564);

select*from eventos
select*from localizacion
truncate table eventos CASCADE
drop table localizacion

truncate table eventos

