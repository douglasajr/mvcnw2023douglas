<section>
    <h2>Listado de Categorias</h2>
</section>
<section>
    <table>
        <thead>
        <tr>
            <th>Id</th>
            <th>Nombre</th>
            <th>Status</th>
            <th><a href="">Nuevo</a></th>
        </tr>
        </thead>
        <tbody>
            {{foreach categorias}}
            <tr>
                <th>{{id}}</th>
                <th>{{name}}</th>
                <th>{{status}}</th>
                <th><a href="">Editar</a> | <a href="">Eliminar</a></th>
            </tr>
            {{endfor categorias}}
        </tbody>
    </table>
</section>