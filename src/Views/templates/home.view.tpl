<section class="product-category w-full align-center justify-between">
    <h2 class="text-2xl font-bold text-blue-900 text-center mb-4">Ofertas del Día</h2>
    <div class="flex flex-wrap align-center justify-evenly p-4">
        {{foreach productsOnSale}}
        <article class="bg-white p-6 rounded-lg shadow-lg" data-productId="{{productId}}">
            <img class="w-12 h-15  mb-4" src="{{productImgUrl}}" alt="{{productName}}">
            <h3 class="text-xl font-semibold mb-2">{{productName}}</h3>
            <p class="text-gray-700 mb-4">{{productDescription}}</p>
            <span class="text-xl font-bold text-green-500">{{productPrice}}</span>
            <button class="block bg-blue-500 text-white px-4 py-2 mt-4 mx-auto rounded-full hover:bg-blue-600">Agregar al Carrito</button>
        </article>
        {{endfor productsOnSale}}
    </div>
</section>

<section class="product-category">
    <h2 class="text-2xl font-bold text-blue-900 text-center mb-4">Destacados</h2>
    <div class="flex flex-wrap align-center justify-evenly p-4">
        {{foreach productsHighlighted}}
        <article class="bg-white p-6 rounded-lg shadow-lg" data-productId="{{productId}}">
            <img class="w-12 h-15 mb-4" src="{{productImgUrl}}" alt="{{productName}}">
            <h3 class="text-xl font-semibold mb-2">{{productName}}</h3>
            <p class="text-gray-700 mb-4">{{productDescription}}</p>
            <span class="text-xl font-bold text-green-500">{{productPrice}}</span>
            <button class="block bg-blue-500 text-white px-4 py-2 mt-4 mx-auto rounded-full hover:bg-blue-600">Agregar al Carrito</button>
        </article>
        {{endfor productsHighlighted}}
    </div>
</section>

<section class="product-category">
    <h2 class="text-2xl font-bold text-blue-900 text-center mb-4">Novedades</h2>
    <div class="flex flex-wrap align-center justify-evenly p-4">
        {{foreach productsNew}}
        <article class="bg-white p-6 rounded-lg shadow-lg" data-productId="{{productId}}">
            <img class="w-12 h-15 mb-4" src="{{productImgUrl}}" alt="{{productName}}">
            <h3 class="text-xl font-semibold mb-2">{{productName}}</h3>
            <p class="text-gray-700 mb-4">{{productDescription}}</p>
            <span class="text-xl font-bold text-green-500">{{productPrice}}</span>
            <button class="block bg-blue-500 text-white px-4 py-2 mt-4 mx-auto rounded-full hover:bg-blue-600">Agregar al Carrito</button>
        </article>
        {{endfor productsNew}}
    </div>
</section>
