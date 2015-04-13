function initialize() {
    var origin = new google.maps.LatLng(12.13639, -86.25139);

    var mapOptions = {
        center: origin,
        zoom: 13,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);

    var infowindow = new google.maps.InfoWindow();

    var mapObjs = [];

    function drawAllPoints (argument) {
        while(mapObjs.length != 0){
            mapObjs.pop().setMap(null);
        }
        getAndDrawPoints("/getDiseases", "#996600");
        getAndDrawPoints("/getPests", "#6600FF");
    }

    function getAndDrawPoints(page, color) {
        var bound = map.getBounds().getSouthWest(); 
        var x = map.getCenter().lat(), y = map.getCenter().lng();
        var center = new google.maps.LatLng(x, y);
        var sw = new google.maps.LatLng(bound.k, bound.D);
        var radius = google.maps.geometry.spherical.computeDistanceBetween(center, sw);   
        $.post(page, {x: x, y: y, radius: radius}, function (points) {
            if(points){
                console.log("Número: " + points.length, "Radio: " + radius);
                points.forEach(function (point) {
                    var position = new google.maps.LatLng(point.x, point.y);

                    var circleOptions = {
                      strokeColor: color,
                      strokeOpacity: 0.8,
                      strokeWeight: 2,
                      fillColor: color,
                      fillOpacity: 0.35,
                      map: map,
                      center: position,
                      radius: point.radius
                    };

                    var marker = new google.maps.Marker({
                        position: position,
                        title: point.id.toString(),
                        map: map,
                        draggable: false
                    });

                    var circle = new google.maps.Circle(circleOptions);

                    google.maps.event.addListener(marker, 'click', function() {
                        infowindow.setContent("<strong>Name:</strong> " + point.name + 
                            "<br><strong>Description:</strong> " + point.description +
                            "<br><strong>Informative URL:</strong> <a href=\"" + point.url + "\">" + point.url + "</a>" +
                            "<br><strong>Start Date:</strong> " + point.start_date);
                        infowindow.open(map, this);
                    });

                    mapObjs.push(marker);
                    mapObjs.push(circle);
                });
            }
        });
    }

    google.maps.event.addListenerOnce(map, 'idle', drawAllPoints);
    google.maps.event.addListener(map, 'dragend', drawAllPoints);
    google.maps.event.addListener(map, 'zoom_changed', drawAllPoints);
}

$(function () {
    initialize();
});
