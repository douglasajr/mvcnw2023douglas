<?php

namespace Controllers\Productos\Categorias;

use Controllers\PublicController;
use Dao\Products\Categorias;
use Views\Renderer;

class CategoriasList extends PublicController 
{
    public function run(): void 
    {
        $dataView = array();
        $dataView ["categorias"] = Categorias::getCategorias();

        Renderer::render('productos/categorias/lista', $dataView);

    }

}
