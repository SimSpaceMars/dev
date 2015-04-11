function initialize() {
    var mapOptions = {
        center: new google.maps.LatLng(12.13639, -86.25139),
        zoom: 13,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
}
$(function () {
    initialize();
});
