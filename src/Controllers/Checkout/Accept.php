<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
//use phpDocumentor\Reflection\DocBlock\Tags\Var_;

class Accept extends PublicController{
    public function run():void
    {
        $dataview = array();
        $token = $_GET["token"] ?: "";
        $session_token = $_SESSION["orderid"] ?: "";
        if ($token !== "" && $token == $session_token) {
            $result = \Utilities\Paypal\PayPalCapture::captureOrder($session_token);



            $dataview["orderjson"] = json_encode($result, JSON_PRETTY_PRINT);

            $userid= \Utilities\Security::getUserId();
            $carrito = \Dao\Mnt\Carrito::getCarrito($userid);

            foreach($carrito as $c){
                 \Dao\Mnt\Historial::insert($c['usercod'],$c['juegos_id'],$c['cantidad']);
            }

            
            foreach($carrito as $c){
                 $c['imagen'] = "data:image/jpg;base64," . base64_encode($c['imagen']);                          
        
                 $dataview["keys"][] = $c;  

             }            
             
             \Dao\Mnt\Carrito::limpiarCarrito($userid);


        } else {
            $dataview["orderjson"] = "No Order Available!!!";
        }
        
        \Views\Renderer::render("paypal/accept", $dataview);
    }
}

?>
