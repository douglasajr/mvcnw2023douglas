<section>
	<div class="container">
		<center>

			<h1 class="text-center fw-bold ">Pasarela De Pago</h1>
			<br>
			{{if vacio}}
			<center>

				<h1>Carrito Vacio</h1>
			</center>
			{{endif vacio}}

			{{foreach carrito}}
			<div class="bg-dark py-5 row ">
				<center>

					<div class="fw-bold me-3 col-md-4 shadow-lg p-1 mb-5 bg-body rounded">
						<div class="card mb-4 shadow-sm">
							<div class="card-img-top"
								style="background-size: cover; background-repeat: no-repeat; background-image: url('{{imagen64}}'); height: 7cm;">
							</div>
							<div class="card-body">
								<h4 class="fw-bold card-title">{{nombre}}</h4>
								<h4 class="fw-bold card-title">x{{cantidad}}</h4>
								<h5 class="fw-bold card-text">$ {{totalP}}</h5>
								<h5 class="fw-bold card-text">{{publisher}}</h5>
								<h5 class="fw-bold card-text">{{genero}}</h5>


							</div>
						</div>
					</div>


				</center>
			</div>
			{{endfor carrito}}
			<div class="bg-dark py-5">
				<h2 class="text-white">Total Pedido: {{totalP}} $ + ISV</h2>
				<a href="index.php?page=Checkout_Checkout">

					<form action="index.php?page=checkout_checkout" method="post">

						<button class="bg-dark text-info btn btn-lg border-info" type="submit">Confirmar Compra</button>
					
					</form>

					<div id="paypal-button-container"></div>
					<p id="result-message"></p>
					<!-- Replace the "test" client-id value with your client-id -->
					<script src="https://www.paypal.com/sdk/js?client-id=test&components=buttons&enable-funding=paylater,venmo,card" data-sdk-integration-source="integrationbuilder_sc"></script>
					<script src="app.js"></script>

				</a>
			</div>

		</center>

	</div>

</section>