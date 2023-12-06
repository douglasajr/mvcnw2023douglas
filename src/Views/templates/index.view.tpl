<section class="">
  {{if msg}}
    <div id="custom-alert" class="d-flex alert alert-success alert-dismissible fade show" role="alert">
      <p style="letter-spacing:4px;" class="fs-4 me-2" id="alert-message">{{msg}} <span
          class="fs-4 btn btn-outline-success close" onclick="cerrarAlerta()" aria-hidden="true">&times;</span> </p>

    </div>

    {{endif msg}}

    <div class=" container ">

      <h1 class="fw-bold text-center py-5">Catálogo</h1>

      <form class="w-100 d-flex justify-content-center" action="index.php" method="post">
        <select name="genero" id="genero" class="w-25 text-center form-select btn-light" onchange="submitForm()">
          <option value="" disabled selected>-- Tipo De Calzado --</option>
          <option value="xx">Sin filtro</option>
          {{foreach generos}}
            <option value="{{genero}}">{{genero}}</option>
            {{endfor generos}}
          </select>
        </form>

        <br>
        <div class="row justify-content-center">


          {{foreach Juegos}}
            <div class="mx-5 mb-5 col-md-3 shadow-lg px-1 mb-3 bg-body rounded-pill">
              <div class="shadow-none mb-4">
                <div class="fw-bold card-img-top"
                  style="background-size: cover; background-repeat: no-repeat; background-image: url('{{imagen}}'); height: 7cm;">
                </div>
                <div class="fw-bold text-center card-body">
                  <h4 class="fw-bold card-title">{{nombre}}</h4>
                  <h5 class="fw-bold card-text">$ {{precio}}</h5>
                  <h5 class="fw-bold card-text">{{publisher}}</h5>
                  <h5 class="fw-bold card-text">{{genero}}</h5>
                 

                  {{if ~logged}}
                    <center>
                      <a class="text-decoration-none" href="index.php?page=mnt_Addcarrito&id={{idJuego}}">
                        <div id="btn-cart" class="border border-gray rounded-pill w-25 d-flex justify-content-center">
                        <div class=" text-dark fw-bold fs-5 card-img-top"
                        style="background-size: cover ;width:1cm;height:1cm;background-repeat: no-repeat; background-image: url('public/imgs/Caratulas/shopping-cart_icon-icons.com_72552.png'););">
                        </div>
                        <p class="text-primary">+</p>
                        </div>
                      </a>
                    </center>
                    {{endif ~logged}}

                  </div>
                </div>

              </div>


              {{endfor Juegos}}



            </div>
          </div>

          <script>
            function submitForm() {
              var form = document.querySelector('form');
              form.submit();
            }

            function cerrarAlerta() {
              document.getElementById("custom-alert").classList.remove("d-block");
              document.getElementById("custom-alert").classList.add("d-none");
            }
          </script>


        </section>