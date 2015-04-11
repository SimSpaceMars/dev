var pg = require('pg');
var connectionString = "pg://croper:croper@localhost/crops";

module.exports.query = function(cb) {
    pg.connect(connectionString, function(err, client, done) {
        if(err){
            console.log("Error de conexión a la base de datos: " + err);
        }
        else{

            function savePoint (table) {
                return function(point) {
                    if(isNaN(point.x) || isNaN(point.y)){
                        console.log("Error, las coordinadas proporcionadas no son valores numéricos.");
                    }
                    else{
                        client.query("INSERT INTO " + table + "(name, description, url, point, radius) VALUES " +
                            "($1, $2, $3, ST_GeomFromText('POINT(" + point.x + " " + point.y + ")'), $4);", 
                            [point.name, point.description, point.url, point.radius], function(err, result) {
                                if(err)
                                    console.log("Eror al agregar punto: " + err);
                                done();
                        });
                    }
                };
            }

            function getPointsInRange(table) {
                return function(cb, range) {
                    client.query("SELECT id, name, description, url, start_date, ST_X(point) as x, ST_Y(point) as y, radius FROM " +
                        table + " WHERE ST_DWithin(ST_GeomFromText('POINT(" + range.x + " " + range.y + ")'), ST_Buffer(point, radius), $1)", 
                        [range.radius], function(err, result) {
                            if(err){
                                console.log("Eror al obtener la lista de puntos: " + err);
                                done();
                                cb(null);
                            }
                            else{
                                done();
                                cb(result.rows);
                            }
                        });
                };
            }

            cb({
                saveDisease: savePoint("DiseasePoint"),
                savePest: savePoint("PestPoint"),
                getDiseasesInRange: getPointsInRange("DiseasePoint"),
                getPestsInRange: getPointsInRange("PestPoint")
            });
        }
    });
}


