<section>
    <div class="container">
        <h1 class="text-center fs-1 fw-bold">Historial De Ventas</h1>
        <br>        
        <br>
        <div>
            <center>
                <table class="ms-5 table table-striped w-100 fs-4" >
                    <thead class="btn-outline">
                        <tr>
                            <th> Juego </th>
                            <th> Precio </th>
                            <th> Cantidad </th>
                            <th> Total </th>
                            <th> Publicadora </th>
                            <th> Fecha Compra </th>
                        </tr>
                    </thead>
                    <tbody>
                        {{foreach historial}}
                        <tr>
                            <td> {{nombre}} </td>
                            <td> {{precio}} $ </td>
                            <td> {{cantidad}}</td>
                            <td> {{totalP}} $ </td>
                            <td> {{publisher}} </td>
                            <td> {{created_at}} </td>
                        </tr>
                        {{endfor historial}}
                        
                        <tr>
                            <td>ISV</td>
                            <td class="text-success fw-bold">{{ISV}} $</td>
                            <td>Total</td>
                            <td class="text-success fw-bold">{{totalP}} $</td>
                        </tr>
                    </tbody>
                </table>
            </center>
        </div>
    </div>
</section>