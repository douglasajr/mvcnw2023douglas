<?php

namespace Controllers\Mnt;

use Controllers\PublicController;
use \Dao\Mnt\Juegos as DaoJuegos;
use Views\Renderer;

class Delcarrito extends PublicController{

    public function run() : void
    {
        
        $idJuego=$_GET['id'];
        
        $userId = \Utilities\Security::getUserId();
        $userName = \utilities\Security::getUser()['userName'];
        \Dao\Mnt\Carrito::delCarrito($idJuego,$userId);
        $cantidad=0; 
        
        $carrito = \Dao\Mnt\Carrito::getCarrito($userId);
        $viewData = array(
            "new_enabled"=>true,
            "edit_enabled"=>true,
            "delete_enabled"=>true,            
            'username'=>$userName,
            'totalP'=>0
        );        

        foreach($carrito as $C){
            $C['imagen64'] = "data:image/jpg;base64," . base64_encode($C['imagen']);          
            $C["totalP"] =$C['precio'] * $C['cantidad'];            
            $cantidad += $C['cantidad'];
            $viewData["carrito"][] = $C;    
        } 


        if(count($carrito)==0){
            $viewData['vacio']=true;
      }else{
          $viewData['cuenta']=$cantidad;
          $viewData['novacio']=true;
      }

        Renderer::render("mnt/carrito", $viewData);
    }
}

?>