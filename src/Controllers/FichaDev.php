<?php

namespace Controllers;
use Views\Renderer;

class FichaDev extends PublicController {

    private $viewData = array();

    public function run(): void { //pageload

        $this -> viewData["Nombre"] = "Douglas Aguilera";
        $this -> viewData["correo"] = "Douglas@gmail.com";
        Renderer::render("fichadev", $this->viewData);

    }

}