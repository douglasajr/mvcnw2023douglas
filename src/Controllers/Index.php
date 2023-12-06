<?php


namespace Controllers;

/**
 * Index Controller
 *
 * @category Public
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @link     http://
 */
class Index extends PublicController
{
    /**
     * Index run method
     *
     * @return void
     */
    public function run(): void
    {
        $viewData = array();

        if (isset($_POST['genero']) and $_POST['genero']!="xx" ) {

            $Juegos = \Dao\Mnt\Juegos::getByGenero($_POST['genero']);        

        } else {

            $Juegos = \Dao\Mnt\Juegos::getAllGames();
        }

        $viewData['generos'] = \Dao\Mnt\Juegos::getGeneros();

        $viewData["Juegos"] = array();

        foreach ($Juegos as $J) {

            $J['imagen'] = "data:image/jpg;base64," . base64_encode($J['imagen']);
            $viewData["Juegos"][] = $J;

        }

        $viewData['logged'] = \Utilities\Security::isLogged();

        \Views\Renderer::render("index", $viewData);
    }
}
