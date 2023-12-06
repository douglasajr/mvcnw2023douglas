<?php

namespace Controllers\Checkout;

use Controllers\PublicController;

class Checkout extends PublicController{
    public function run():void
    {
        $viewData = array();
        if ($this->isPostBack()) {
            $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
                "test".(time() - 10000000),
                "http://localhost:80/Proyecto/mvcnw2023douglas/index.php?page=checkout_error",
                "http://localhost:80/Proyecto/mvcnw2023douglas/index.php?page=checkout_accept",
            );
             $userid= \Utilities\Security::getUserId();
             $carrito = \Dao\Mnt\Carrito::getCarrito($userid);

             foreach($carrito as $c){
                 $PayPalOrder->addItem($c['nombre'], $c['descripcion'], "GPRD".$c['juegos_id'], $c['precio'], 2.7, $c['cantidad'], "DIGITAL_GOODS");//pasar cada item a la orden
             }

            $response = $PayPalOrder->createOrder();
            $_SESSION["orderid"] = $response->result->id;
            \Utilities\Site::redirectTo($response->result->links[1]->href);
            /* var_dump($response->result->links[0]->href);
            die(); */        
        }
        
        \Views\Renderer::render("paypal/checkout", $viewData);
    }
}
?>
