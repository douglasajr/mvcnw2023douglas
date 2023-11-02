<h1>Vesiones del Sistema</h1>

{{if hasVersionRows}}
<table class="table table-striped">
    <thead>
        <tr>
            <th>Version</th>
            <th>Descripcion</th>
            <th>Fecha</th>
        </tr>
    </thead>
    <tbody>
        {{foreach versions}}
        <tr>
            <td>{{version}}</td>
            <td>{{description}}</td>
            <td>{{create_at}}</td>
        </tr>
        {{endfor versions}}
    </tbody>

</table>
{{endif hasVersionRows}}