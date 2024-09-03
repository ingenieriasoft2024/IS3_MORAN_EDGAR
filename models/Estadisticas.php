<?php

namespace Model;

class Estadisticas extends ActiveRecord
{
    protected static $tabla = 'operaciones';
    protected static $idTabla = 'operaciones_id';
    protected static $columnasDB = ['operaciones_fecha', 'operaciones_origen', 'operaciones_destino', 'operaciones_estado', 'operaciones_dep_id' ];

    public $operaciones_id;
    public $operaciones_fecha;
    public $operaciones_origen;
    public $operaciones_destino;
    public $operaciones_estado;
    public $operaciones_dep_id;


    public function __construct($args = [])
    {
        $this->operaciones_id = $args['operaciones_id'] ?? null;
        $this->operaciones_fecha = $args['operaciones_fecha'] ?? '';
        $this->operaciones_origen = $args['operaciones_origen'] ?? '';
        $this->operaciones_destino = $args['operaciones_destino'] ?? '';
        $this->operaciones_estado = $args['operaciones_estado'] ?? '';
        $this->operaciones_dep_id = $args['operaciones_dep_id'] ?? '';
    }


}