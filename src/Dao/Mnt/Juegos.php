<?php
namespace Dao\Mnt;

use Dao\Table;

class Juegos extends Table{
 
    public static function getAllGames() {
        $selectSql = "SELECT * ,juegos.id as idJuego from juegos inner join genero on genero.id = juegos.genero_id ORDER BY nombre;";
        return self::obtenerRegistros($selectSql, array());
    }

    
    public static function insert(string $nombre, string $descripcion,string $released_date,string $publisher,string $precio,string $imagen,int $genero): int
    {
        $sqlstr = "INSERT INTO juegos (nombre, descripcion,released_date,publisher,precio,imagen,genero_id) values(:nombre, :descripcion,:released_date,:publisher,:precio,:imagen,:genero);";
        $rowsInserted = self::executeNonQuery(
            $sqlstr,
            array(
             "nombre"=>$nombre,
             "descripcion"=>$descripcion,
             "released_date"=>$released_date,
             "publisher"=>$publisher,
             "precio"=>$precio,
             "imagen"=>$imagen,
             "genero"=>$genero,
             )
        );
        return $rowsInserted;
    }


    public static function update(
        string $nombre,
        string $descripcion,
        int $id
    ){
        $sqlstr = "UPDATE juegos set nombre = :nombre, descripcion = :descripcion where id=:id;";
        $rowsUpdated = self::executeNonQuery(
            $sqlstr,
            array(
                "nombre" => $nombre,
                "descripcion" => $descripcion,
                "id" => $id
            )
        );
        return $rowsUpdated;
    }
    public static function delete(int $id){
        $sqlstr = "DELETE from juegos where id=:id;";
        $rowsDeleted = self::executeNonQuery(
            $sqlstr,
            array(
                "id" => $id
            )
        );
        return $rowsDeleted;
    }
   
    public static function findByFilter(){

    }
    public static function findById(int $id){
        $sqlstr = "SELECT * from juegos where id = :id;";
        $row = self::obtenerUnRegistro(
            $sqlstr,
            array(
                "id"=> $id
            )
        );
        return $row;
    }
    
    public static function getGeneros(){
        $sqlstr = "SELECT * from genero order by id ;";
        $row = self::obtenerRegistros(
            $sqlstr,
            array()
        );
        return $row;
    }

    public static function getByGenero($genero){

        $sqlstr = "SELECT * ,juegos.id as idJuego from juegos inner join genero on genero.id = juegos.genero_id  where genero= :genero;";
        $row = self::obtenerRegistros(
            $sqlstr,
            array(
                "genero"=> $genero
            )
        );        
        return $row;

    }

}



?>
