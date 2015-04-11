var port = 8080;

var express = require("express");
var bodyParser = require("body-parser");
var http = require("http");
var worker = require("cluster").worker;
var handlebars = require("express-handlebars").create({
    defaultLayout:"main"
});

var app = express();
app.disable("x-powered-by");

app.engine("handlebars", handlebars.engine);

app.set("view engine", "handlebars");

app.handlebars = handlebars;

app.use(bodyParser.urlencoded({
    extended: true
}));

app.use(bodyParser.json());

http.createServer(app).listen(port, function () {
    console.log("Server iniciado en el puerto " + port + ".");
});

require("./src/routes.js")(app);

/*
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

app.use(require("express-session")({
    secret: config.cookie.secret,
    saveUninitialized: true
}));*/