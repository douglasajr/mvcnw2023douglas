  <h1 class="fw-bold">Administrador de Catalogo</h1>

<section class="WWFilter">

</section>
<section class="WWList">
  <table>
    <thead>
      <tr>
        <th>Código</th>
        <th>Nombre</th>
        <th>Descripcion</th>
        <th>Diseñador</th>
        <th>
          {{if new_enabled}}
          <button class="btn btn-outline-dark" id="btnAdd">Nuevo</button>
          {{endif new_enabled}}
        </th>
      </tr>
    </thead>
    <tbody class="fs-5 fw-bold ">
      {{foreach juegos}}
      <tr>
        <td>{{idJuego}}</td>

        <td class="btn btn-outline-dark mt-3">
          <a href="index.php?page=mnt_juego&mode=DSP&id={{idJuego}}">{{nombre}}
          </a>
        </td>
        <td>{{descripcion}}</td>
        <td>{{publisher}}</td>
        <td>
          {{if ~edit_enabled}}
          <form action="index.php" method="get">
            <input type="hidden" name="page" value="mnt_juego" />
            <input type="hidden" name="mode" value="UPD" />
            <input type="hidden" name="xssToken" value="{{xssToken}}" />
            <input type="hidden" name="id" value={{idJuego}} />
            <button class="btn btn-outline-dark" type="submit">Editar</button>
          </form>
          {{endif ~edit_enabled}}
          {{if ~delete_enabled}}
          <form action="index.php" method="get">
            <input type="hidden" name="page" value="mnt_juego" />
            <input type="hidden" name="mode" value="DEL" />
            <input type="hidden" name="xssToken" value="{{xssToken}}" />
            <input type="hidden" name="id" value={{idJuego}} />
            <button class="btn btn-outline-dark mt-1" type="submit">Eliminar</button>
          </form>
          {{endif ~delete_enabled}}
        </td>

      </tr>
      {{endfor juegos}}
    </tbody>
  </table>
</section>
<script>

  document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("btnAdd").addEventListener("click", function (e) {
      e.preventDefault();
      e.stopPropagation();
      window.location.assign("index.php?page=mnt_juego&mode=INS&id=0");
    });
  });
</script>