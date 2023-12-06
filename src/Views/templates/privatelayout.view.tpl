<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{SITE_TITLE}}</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
  </script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
    integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous">
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
    integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous">
  </script>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="/{{BASE_DIR}}/public/css/appstyle.css" />
  <script src="https://kit.fontawesome.com/{{FONT_AWESOME_KIT}}.js" crossorigin="anonymous"></script>
  {{foreach SiteLinks}}
    <link rel="stylesheet" href="/{{~BASE_DIR}}/{{this}}" />
    {{endfor SiteLinks}}
    {{foreach BeginScripts}}
      <script src="/{{~BASE_DIR}}/{{this}}"></script>
      {{endfor BeginScripts}}

      <script src="https://www.paypal.com/sdk/js?client-id=AVsN78ZukQnFqXYsSoAaG3X-Ey0J3ozQcQO-mU3Qd-iRnoCi1mRi4WN1ng1Sd3zt2_vfBjDK0obP8Z1D&components=buttons&enable-funding=paylater,venmo,card" data-sdk-integration-source="integrationbuilder_sc"></script>
      <script src="/public/api/app.js"></script>

    </head>

    <body>
      <header>
        <input type="checkbox" class="menu_toggle" id="menu_toggle" />
        <label for="menu_toggle" class="menu_toggle_icon">
          <div class="hmb dgn pt-1"></div>
          <div class="hmb hrz"></div>
          <div class="hmb dgn pt-2"></div>
        </label>
        <a style="text-decoration:none;" href="index.php">
          <h1 class="text-white fs-2 fw-bold">{{SITE_TITLE}}</h1>
        </a>

        <nav id="menu">
          <ul class="fs-2">
            <li><a href="index.php"><i class="fas fa-user-plus"></i>&nbsp;Inicio</a></li>
            <li><a href="index.php?page=admin_admin"><i class="fas fa-home"></i>&nbsp;Admin</a></li>
            {{foreach NAVIGATION}}
              <li><a href="{{nav_url}}">{{nav_label}}</a></li>
              {{endfor NAVIGATION}}
              <li><a href="index.php?page=sec_logout"><i class="fas fa-sign-out-alt"></i>&nbsp;Salir</a></li>
            </ul>
          </nav>
          {{with login}}


          <a href="index.php?page=mnt_carrito">
            <div class=" text-dark fw-bold fs-5 card-img-top"
              style="background-size: cover ;width:1cm;height:1cm;background-repeat: no-repeat; background-image: url('public/imgs/Caratulas/shopping-cart_icon-icons.com_72552.png'););">
            </div> 
          </a>

          <span class="username">{{userName}} <a href="index.php?page=sec_logout"><i
                class="fas fa-sign-out-alt"></i></a></span>
          {{endwith login}}
        </header>
        <main>
          {{{page_content}}}
        </main>
        <footer>
          <div>Todo los Derechos Reservados 2023 Lux Shoes &copy;</div>
        </footer>
        {{foreach EndScripts}}
          <script src="/{{~BASE_DIR}}/{{this}}"></script>
          {{endfor EndScripts}}
        </body>

        </html>