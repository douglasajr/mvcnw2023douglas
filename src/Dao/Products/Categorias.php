<?php

namespace Dao\Products;

use Dao\Table;

class Categorias extends Table {
    public static function getCategorias()
    {
        $sqlstr = "SELECT * FROM categorias;";
        return self::obtenerRegistros($sqlstr, []);
    }
    public static function getCategoriasPorId($id) 
    {
        $sqlstr = "SELECT * FROM categorias WHERE id = $id;";
        $params = ["id" => $id];
        return self::obtenerUnRegistro($sqlstr, $params);
    }


    public static function createCategorias($name, $status)
    {

        $params = 
        [
            "name" => $name,
            "status"=> $status
        ];
        $sqlstr = "INSERT INTO categorias(name, status, created_time) VALUES (:name, :status, NOW());";
        return self::executeNonQuery($sqlstr, $params);
    }

    public static function updateCategorias($id, $name, $status)
    {
        $sqlstr = "UPDATE categorias SET name = :name, status = :status WHERE id = :id;";
        $params = [
            "id"=> $id,
            "name"=> $name,
            "status"=> $status
        ];
        return self::executeNonQuery($sqlstr, $params);
    }

    public static function deleteCategorias($id)
    {
        $sqlstr = "DELETE FROM categorias WHERE id = :id;";
        $params = [
            "id" => $id
        ];
        return self::executeNonQuery($sqlstr, $params);
    }
}