<?php

namespace Controllers\Mnt;

use Controllers\PublicController;
use Dao\Dao;
use Views\Renderer;

class Tienda extends PublicController{

    public function run() : void
    {
         $viewData = array();
    //     $viewData["juegos"] = \Dao\Mnt\Quotes::getAllQuotes();

        Renderer::render("mnt/tienda", $viewData);
    }
}

?>
