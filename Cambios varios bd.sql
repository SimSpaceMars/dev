CREATE OR REPLACE FUNCTION add_eventos(latitud numeric(70), state CHAR(2)) 
    RETURNS void AS $$
    BEGIN
      INSERT INTO cities VALUES (city, state);
    END;
    $$ LANGUAGE plpgsql;

select*from eventos

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