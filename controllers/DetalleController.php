<?php

namespace Controllers;

use Exception;
use Model\Estadistica; // Asegúrate de que la clase Estadistica esté en el namespace correcto
use MVC\Router;

class DetalleController {

    public static function estadisticas(Router $router) {
        // Renderiza la vista de estadísticas
        $router->render('operaciones/estadisticas');
    }

    public static function obtenerEstadisticasAPI() {
        try {
            // Llama al método estático obtenerEstadisticas() del modelo Estadistica
            $sql = "SELECT 
                        d.dependencia_nombre, 
                        COUNT(o.operaciones_id) AS total_operaciones
                    FROM 
                        Dependencias d
                    LEFT JOIN 
                        Operaciones o ON d.dependencia_id = o.operaciones_dep_id
                    GROUP BY 
                        d.dependencia_nombre";
            
            // Usa el modelo Estadistica para ejecutar la consulta
            $datos = Estadistica::fetchArray($sql);
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
