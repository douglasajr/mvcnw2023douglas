<?php

namespace Controllers\Mnt;

use Controllers\PublicController;
use \Dao\Mnt\Juegos as DaoJuegos;
use Views\Renderer;

class Juegos extends PublicController{

    public function run() : void
    {
        $viewData = array(
            "new_enabled"=>true,
            "edit_enabled"=>true,
            "delete_enabled"=>true,
            'juegos'=>DaoJuegos::getAllGames()
        );        
      
        Renderer::render("admin/admin", $viewData);
    }
}

?>
