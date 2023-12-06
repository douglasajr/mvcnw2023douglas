<?php

namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;

class Historial extends PublicController{

    public function run() : void
    {
        $userId = \Utilities\Security::getUserId();
        $userName = \utilities\Security::getUser()['userName'];

        
        $historial = \Dao\Mnt\Historial::getHistorial($userId);
        $viewData = array(
            'username'=>$userName,
            'totalP'=>0
        );        

        foreach($historial as $C){
            $C['imagen64'] = "data:image/jpg;base64," . base64_encode($C['imagen']);                    
            $C["totalP"] =$C['precio'] * $C['cantidad'];                              
            $viewData["totalP"] += round($C['precio'] * $C['cantidad'],2);  
            $viewData["historial"][] = $C;    
            
        }         

        $viewData['ISV']=round($viewData['totalP']*0.15,2);
        $viewData['totalP'] -= $viewData['ISV'];
         
        Renderer::render("mnt/historial", $viewData);
    }
}

?>
