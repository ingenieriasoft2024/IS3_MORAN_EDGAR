import { Dropdown } from "bootstrap";
import Chart from "chart.js/auto";

const canvas = document.getElementById('chartOperaciones');
const ctx = canvas.getContext('2d');
const btnActualizar = document.getElementById('actualizar');

const data = {
    labels: [],
    datasets: [{
        label: 'Operaciones por Comando',
        data: [],
        borderWidth: 5,
        backgroundColor: []
    }]
};

const chartOperaciones = new Chart(ctx, {
    type: 'bar',
    data: data,
});

const getEstadisticas = async () => {
    const url = `/IS3_MORAN_EDGAR/API/detalle/operaciones`
    const config = { method: "GET" }
    const response = await fetch(url, config);
    const data = await response.json()

    if(data){
        if(chartOperaciones.data.datasets[0]) {
            chartOperaciones.data.labels = [];
            chartOperaciones.data.datasets[0].data = [];
            chartOperaciones.data.datasets[0].backgroundColor = [];
            data.forEach(r => {
                chartOperaciones.data.labels.push(r.dependencia_nombre);
                chartOperaciones.data.datasets[0].data.push(r.total_operaciones);
                chartOperaciones.data.datasets[0].backgroundColor.push(generateRandomColor());
            });
        }
    }

    chartOperaciones.update();
}

const generateRandomColor = () => {
    const r = Math.floor(Math.random() * 256);
    const g = Math.floor(Math.random() * 256);
    const b = Math.floor(Math.random() * 256);

    return `rgb(${r}, ${g}, ${b})`;
}

btnActualizar.addEventListener('click', getEstadisticas);
