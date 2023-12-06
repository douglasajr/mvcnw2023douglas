<?php

namespace Controllers\Mnt;

use Controllers\PublicController;
use Exception;
use Views\Renderer;

class Juego extends PublicController
{
    private $redirectTo = "index.php?page=Mnt-Juegos";
    private $viewData = array(
        "mode" => "DSP",
        "modedsc" => "",
        "id" => 0,
        "nombre" => "",
        "descripcion" => "",
        "general_errors" => array(),
        "has_errors" => false,
        "show_action" => true,
        "readonly" => false,
        "xssToken" => ""
    );
    private $modes = array(
        "DSP" => "Detalle de %s (%s)",
        "INS" => "Nuevo Juego",
        "UPD" => "Editar %s (%s)",
        "DEL" => "Borrar %s (%s)"
    );
    public function run(): void
    {
        try {
            $this->page_loaded();
            if ($this->isPostBack()) {
                $this->validatePostData();
                if (!$this->viewData["has_errors"]) {
                    $this->executeAction();
                }
            }
            $this->render();
        } catch (Exception $error) {
            unset($_SESSION["xssToken_Mnt_Juego"]);
            error_log(sprintf("Controller/Mnt/Juego ERROR: %s", $error->getMessage()));
            \Utilities\Site::redirectToWithMsg(
                $this->redirectTo,
                "Algo Inesperado Sucedió. Intente de Nuevo."
            );
        }
    }

    private function page_loaded()
    {
        if (isset($_GET['mode'])) {
            if (isset($this->modes[$_GET['mode']])) {
                $this->viewData["mode"] = $_GET['mode'];
            } else {
                throw new Exception("Mode Not available");
            }
        } else {
            throw new Exception("Mode not defined on Query Params");
        }
        if ($this->viewData["mode"] !== "INS") {
            if (isset($_GET['id'])) {
                $this->viewData["id"] = intval($_GET["id"]);
            } else {
                throw new Exception("Id not found on Query Params");
            }
        }
    }
    private function validatePostData()
    {
        if (isset($_POST["xssToken"])) {
            if (isset($_SESSION["xssToken_Mnt_Juego"])) {
                if ($_POST["xssToken"] !== $_SESSION["xssToken_Mnt_Juego"]) {
                    throw new Exception("Invalid Xss Token no match");
                }
            } else {
                throw new Exception("Invalid Xss Token on Session");
            }
        } else {
            throw new Exception("Invalid Xss Token");
        }
        if (isset($_POST["nombre"])) {
            if (\Utilities\Validators::IsEmpty($_POST["nombre"])) {
                $this->viewData["has_errors"] = true;
                $this->viewData["nombre_error"] = "El nombre no puede ir vacío!";
            }
        } else {
            throw new Exception("nombre not present in form");
        }

        if (isset($_POST["mode"])) {
            if (!key_exists($_POST["mode"], $this->modes)) {
                throw new Exception("mode has a bad value");
            }
            if ($this->viewData["mode"] !== $_POST["mode"]) {
                throw new Exception("mode value is different from query");
            }
        } else {
            throw new Exception("mode not present in form");
        }
        if (isset($_POST["id"])) {
            if (($this->viewData["mode"] !== "INS" && intval($_POST["id"]) <= 0)) {
                throw new Exception("catId is not Valid");
            }
            if ($this->viewData["id"] !== intval($_POST["id"])) {
                throw new Exception("id value is different from query");
            }
        } else {
            throw new Exception("id not present in form");
        }

        if ($this->viewData["mode"] !== "DEL") {
            if ($this->viewData["mode"] !== "UPD") {
                $Imagen = $_FILES['image']['tmp_name'];
                $imgContent = (file_get_contents($Imagen));
                $this->viewData['imagen'] = $imgContent;
                $this->viewData['genero'] = intval($_POST['genero']);
                $this->viewData['released_date'] = $_POST['released_date'];
                $this->viewData['precio'] = $_POST['precio'];
                $this->viewData['publisher'] = $_POST['publisher'];
            }

            $this->viewData["descripcion"] = $_POST["descripcion"];
            $this->viewData["nombre"] = $_POST["nombre"];
        }
    }
    private function executeAction()
    {
        switch ($this->viewData["mode"]) {
            case "INS":
                $inserted = \Dao\Mnt\Juegos::insert(
                    $this->viewData["nombre"],
                    $this->viewData["descripcion"],
                    $this->viewData["released_date"],
                    $this->viewData["publisher"],
                    $this->viewData["precio"],
                    $this->viewData["imagen"],
                    $this->viewData['genero']
                );

                if ($inserted > 0) {
                    \Utilities\Site::redirectToWithMsg(
                        $this->redirectTo,
                        "Calzado Creado Exitosamente"
                    );
                }
                break;
            case "UPD":
                $updated = \Dao\Mnt\Juegos::update(
                    $this->viewData["nombre"],
                    $this->viewData["descripcion"],
                    $this->viewData["id"]
                );
                if ($updated > 0) {
                    \Utilities\Site::redirectToWithMsg(
                        $this->redirectTo,
                        "Calzado Actualizado Exitosamente"
                    );
                }
                break;
            case "DEL":
                $deleted = \Dao\Mnt\Juegos::delete(
                    $this->viewData["id"]
                );
                if ($deleted > 0) {
                    \Utilities\Site::redirectToWithMsg(
                        $this->redirectTo,
                        "Calzado Eliminado Exitosamente"
                    );
                }
                break;
        }
    }
    private function render()
    {
        $xssToken = md5("CATEGORIA" . rand(0, 4000) * rand(5000, 9999));
        $this->viewData["xssToken"] = $xssToken;
        $_SESSION["xssToken_Mnt_Juego"] = $xssToken;

        if ($this->viewData["mode"] === "INS") {
            $this->viewData["modedsc"] = $this->modes["INS"];
            $this->viewData['generos'] = \Dao\Mnt\Juegos::getGeneros();
        } else {
            $tmpJuegos = \Dao\Mnt\Juegos::findById($this->viewData["id"]);
            if (!$tmpJuegos) {
                throw new Exception("Zapato no existe en DB (ID_ZAPATO =" . $this->viewData['id']);
            }

            \Utilities\ArrUtils::mergeFullArrayTo($tmpJuegos, $this->viewData);

            $this->viewData["modedsc"] = sprintf(
                $this->modes[$this->viewData["mode"]],
                $this->viewData["nombre"],
                $this->viewData["id"]
            );
            if (in_array($this->viewData["mode"], array("DSP", "DEL"))) {
                $this->viewData["readonly"] = "readonly";
            }
            if ($this->viewData["mode"] === "DSP") {
                $this->viewData["show_action"] = false;
            }
        }
        Renderer::render("mnt/juego", $this->viewData);
    }
}
