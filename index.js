var db = require("./src/model/points.js");
db.query(function (points) {
    points.saveDisease({
        name: 'CropsCROPS', 
        description: 'wow so mcuh crops', 
        url: 'https://dog.wow/really/wow',
        x: 12.12,
        y: 155.22,
        radius: 300
    });
    points.getDiseasesInRange(function (results) {
        console.log(results);
    }, {x: 12.12, y: 155.22, radius: 300});
});

