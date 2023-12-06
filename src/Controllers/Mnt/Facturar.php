<?php

namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;

class Facturar extends PublicController{

    public function run() : void
    {
        $userId = \Utilities\Security::getUserId();
        $userName = \utilities\Security::getUser()['userName'];

        
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
            $viewData["totalP"] += $C['precio'] * $C['cantidad'];    
            $viewData["carrito"][] = $C;    
        } 


        if(count($carrito)==0){
            $viewData['vacio']=true;
      }else{
          $viewData['cuenta']=count($carrito);
      }

      
         
        Renderer::render("mnt/facturar", $viewData);
    }
}

?>
