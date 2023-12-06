<h1>{{mode_dsc}}</h1>
<section class="text-center container">
  <form action="index.php?page=mnt_juego&mode={{mode}}&id={{id}}" method="POST" enctype="multipart/form-data">
    <section class="mb-3">
      <label for="id" class="form-label">Código</label><br>
      <input type="hidden" id="id" name="id" value="{{id}}" />
      <input type="hidden" id="mode" name="mode" value="{{mode}}" />
      <input type="hidden" name="xssToken" value="{{xssToken}}" />
      <input type="number" readonly name="iddummy" value="{{id}}" class="form-control text-center" />
    </section>
    <section class="mb-3">
      <label for="nombre" class="form-label">Nombre</label><br>
      <input type="text" {{readonly}} name="nombre" value="{{nombre}}" maxlength="45" placeholder="Escriba aqui..."
        class="form-control text-center" />
    </section>
    <section class="mb-3">
      <label for="catest" class="form-label">Descripcion</label><br>
      <input type="text" {{readonly}} name="descripcion" value="{{descripcion}}" maxlength="45"
        placeholder="Esciba aqui..." class="form-control text-center" />
    </section>

    <section class="mb-3">
      <label for="catest" class="form-label">Fecha de Lanzamiento</label><br>
      <input type="date" {{readonly}} name="released_date" value="{{released_date}}" maxlength="45"
        class="form-control text-center" />

    </section>

    <section class="mb-3">
      <label class="form-label">Fabrica</label><br>
      <input type="text" {{readonly}} name="publisher" value="{{publisher}}" maxlength="45"
        placeholder="Escriba aqui..." class="form-control text-center" />

    </section>

    <section class="mb-3">
      <label for="" class="form-label ">Precio</label><br>
      <input type="text" {{readonly}} name="precio" value="{{precio}}" maxlength="45"
        placeholder="Escriba aqui..." class="form-control text-center" />

    </section>
    {{if ~show_action}}
    <br>
    <section class="mb-3">
      <label for="image" class="form-label">Imagen</label><br>
      <input type="file"  name="image" id="image" class="form-control">

    </section>  
    {{endif ~show_action}}

    {{if generos}}
    <label for="genero" class="form-label">Genero</label><br>
    <select name="genero" id="" class="text-center form-select">
      {{foreach generos}}
      <option value="{{id}}">{{genero}}</option>
      {{endfor generos}}
    </select>
    {{endif generos}}
    {{if hasErrors}}
    <section class="mb-3">
      <ul class="list-group">
        {{foreach aErrors}}
        <li class="list-group-item">{{this}}</li>
        {{endfor aErrors}}
      </ul>
    </section>
    {{endif hasErrors}}
    <br>
    <section class="mb-3">
      {{if ~show_action}}
      <button type="submit" name="btnGuardar" value="G" class="btn btn-primary">Guardar</button>
      {{endif ~show_action}}
      <button type="button" id="btnCancelar" class="btn btn-outline-dark">Cancelar</button>


      <script>
        document.addEventListener("DOMContentLoaded", function () {
          document.getElementById("btnCancelar").addEventListener("click", function (e) {
            e.preventDefault();
            e.stopPropagation();
            window.location.assign("index.php?page=mnt_juegos");
          });
        });


      </script>