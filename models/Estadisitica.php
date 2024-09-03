<?php
namespace Model;

class Estadistica extends ActiveRecord
{
    protected static $tabla = 'Operaciones';
    protected static $columnasBD = []; // No necesitamos columnas específicas para la consulta
    protected static $idTabla = null; // No se usa un ID específico en este caso

    // No se definen propiedades públicas, ya que no se mapearán directamente a columnas de la tabla

    public function __construct($args = [])
    {
        // Constructor vacío o personalizado si se necesita
    }

    // Método para obtener estadísticas
    public static function obtenerEstadisticas()
    {
        $query = "SELECT d.dependencia_nombre, COUNT(o.operaciones_id) as total_operaciones
                  FROM Dependencias d
                  LEFT JOIN Operaciones o ON d.dependencia_id = o.operaciones_dep_id
                  GROUP BY d.dependencia_nombre";
        $resultado = self::consultarSQL($query);
        return $resultado;
    }
}
