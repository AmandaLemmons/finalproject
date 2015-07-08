$(window).ready(function(){

window.map = L.map('map');

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
    maxZoom: 18,
    id: 'anlemmons368.1989c0cf',
    accessToken: 'pk.eyJ1IjoiYW5sZW1tb25zMzY4IiwiYSI6ImVkNjJjY2FjMTk2OWViODA1MDFhZWE5NjY2Yzc1MGI4In0.BLhNhZGJJP-ZMPPK7tt-PQ'
}).addTo(window.map);



});
