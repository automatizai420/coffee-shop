defmodule CoffeeShopWeb.Components.UI.ProductCard do
  use Phoenix.Component
  use CoffeeShopWeb, :verified_routes
  
  attr :product, :map, required: true
  attr :conn, :any, required: false # Cambiado a no requerido y con _ si no se usa
  
  def product_card(assigns) do
    ~H"""
    <div class="rounded-lg overflow-hidden h-full flex flex-col transition-all duration-300 hover:scale-[1.02] group">
      <!-- Contenedor de imagen con fondo transparente -->
      <div class="relative pt-[120%] sm:pt-[100%] bg-transparent">
        <img
          src={get_image_path(@product.name)}
          alt={"Imagen de #{@product.name}"}
          class="absolute top-0 left-0 w-full h-full object-contain p-6 sm:p-4 group-hover:p-3 transition-all"
          loading="lazy"
        />
      </div>
      
      <!-- Contenedor de texto con colores oscuros -->
      <div class="p-6 sm:p-4 flex-grow flex flex-col bg-transparent">
        <!-- Nombre del producto con bebas y uppercase -->
        <h3 class="text-xl sm:text-lg font-bebas font-semibold text-gray-900 mb-3 sm:mb-2 uppercase tracking-wide"><%= @product.name %></h3>
        
        <!-- Descripción también en uppercase para mantener consistencia -->
        <p class="text-gray-700 text-base sm:text-sm line-clamp-2 flex-grow font-bebas uppercase tracking-wide">
          <%= @product.description %>
        </p>
        
        <!-- Botón con estilo destacado también en bebas uppercase -->
        <div class="mt-6 sm:mt-4 text-right">
          <.link
            navigate={~p"/products/#{@product.id}"}
            class="inline-block text-base sm:text-sm font-bebas font-medium text-amber-600 hover:text-amber-800 transition-colors underline underline-offset-4 decoration-1 uppercase tracking-wide"
          >
            Ver detalles
          </.link>
        </div>
      </div>
    </div>
    """
  end
  
  defp get_image_path(product_name) do
    case String.downcase(product_name) do
      "chocolate vainilla" -> ~p"/images/products/chocolate/desktop_paquete_chocolate.png"
      "manzanilla" -> ~p"/images/products/flores/desktop_paquete_flores.png"
      "mango" -> ~p"/images/products/mango/desktop_paquete_mango.png"
      "chocolate caramelo" -> ~p"/images/products/caramelo/caramelo.png"
      _ -> ~p"/images/products/default.png"
    end
  end
end