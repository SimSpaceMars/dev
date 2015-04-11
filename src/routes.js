module.exports = function (app) {
    app.get("/", function (req, res) {
        res.type("text/html");
        res.render("home", {
            title: "Crops - Sistema de control de plagas",
            description: "Crops landing page"
        });
    });

    app.get("/new", function (req, res) {
        res.type("text/html");
        res.render("new", {
            title: "Agregar nuevo punto",
            description: "Agregar nuevo punto de plaga o enfermedad"
        });
    });

    app.use(function (req, res) {
        res.type("text/plain");
        res.status(404);
        res.send("404 - Not Found");
    });

    app.use(function (err, req, res, next) {
        console.error("Express General Error Handler: \n" + err.stack);
        res.type("text/plain");
        res.status(500);
        res.send("500 - Server Error");
    });
}