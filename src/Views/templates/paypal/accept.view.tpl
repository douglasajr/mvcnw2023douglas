<h1>Compra Realizada Exitosamente</h1>
<hr>
{{foreach keys}}
  <div class="fw-bold fs-5 card-img-top" style="background-size: cover ;width:6cm;height:6cm;background-repeat: no-repeat; background-image: url('{{imagen}}');" ></div>
  <p>{{nombre}}</p>  
  
{{endfor keys}}
<hr />
<pre>
  
    <h1>Datos De La Orden Paypal</h1>

{{orderjson}}
</pre>