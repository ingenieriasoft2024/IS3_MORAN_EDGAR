<?php

namespace Controllers;

use Exception;
use Model\Estadisticas;
use MVC\Router;

class DetalleController {

    public static function estadisticas(Router $router) {
        // Renderiza la vista de estadísticas
        $router->render('operaciones/estadisticas');
    }

    public static function obtenerEstadisticasAPI() {
        try {
            // Llama al método estático obtenerEstadisticas() del modelo Estadistica
            $sql = "SELECT dependencia_nombre, 
                    COUNT(operaciones_id) AS total_operaciones
                    FROM Dependencias
                    LEFT JOIN Operaciones ON dependencia_id = operaciones_dep_id
                    GROUP BY dependencia_nombre";
            
            // Usa el modelo Estadistica para ejecutar la consulta
            $datos = Estadisticas::fetchArray($sql);
            echo json_encode($datos);
        } catch (Exception $e) {
            // Maneja cualquier excepción que pueda ocurrir
            echo json_encode([
                'detalle' => $e->getMessage(),
                'mensaje' => 'Ocurrió un error',
                'codigo' => 0
            ]);
        }
    }
}
