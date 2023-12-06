<?php

/**
 * PHP Version 7.2
 *
 * @category Private
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @version  CVS:1.0.0
 * @link     http://
 */
namespace Controllers\Admin;
use \Dao\Mnt\Juegos as DaoJuegos;


/**
 * Página Principal de Administradores
 *
 * @category Public
 * @package  Controllers/Admin
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @link     http://
 */
class Admin extends \Controllers\PrivateController
{
    /**
     * Constructor
     */
    public function __construct()
    {
         \Utilities\Security::isInRol(
            \Utilities\Security::getUserId(),
            "ADMIN"
        );
        
        parent::__construct();
    }
    /** 
     * Ejecuta el controlador
     */
    public function run() :void
    {

        $viewData = array(
            "new_enabled"=>true,
            "edit_enabled"=>true,
            "delete_enabled"=>true,
            'juegos'=>DaoJuegos::getAllGames()
        );  

        \Views\Renderer::render("admin/admin", $viewData);
    }
}
?>
