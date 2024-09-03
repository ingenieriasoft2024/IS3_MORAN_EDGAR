import { Dropdown } from "bootstrap";
import L from 'leaflet';

const map = L.map('map', {
    center: [14.6155198,-90.5819964],
    center: [14.2788902,-89.9167455],
    zoom: 17,
    layers: []
});

// Añadir 
L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);


const markerLayer = L.layerGroup();

const icon = L.icon({
    iconUrl: './images/cit.png',
    iconSize: [35, 35]
});

L.marker([14.6155198,-90.5819964] [14.2788902,-89.9167455], {
    icon: icon
}).addTo(markerLayer);

markerLayer.addTo(map);