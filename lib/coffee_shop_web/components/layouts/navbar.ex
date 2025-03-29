defmodule CoffeeShopWeb.Components.Layouts.Navbar do
  use Phoenix.Component
  use CoffeeShopWeb, :verified_routes

  def navbar(assigns) do
    ~H"""
    <nav id="main-nav" class="bg-[#fff100] shadow-md fixed w-full transition-all duration-300 z-50">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-20 transition-all duration-300">
          <!-- Logo / Inicio -->
          <div class="flex items-center">
            <.link navigate={~p"/"} class="flex items-center space-x-2">
              <img src={~p"/images/logo.png"} alt="Logo" class="h-12 transition-all duration-300">
            </.link>
          </div>

          <!-- Menú principal (Desktop) -->
          <div class="hidden md:flex space-x-6 items-center">
            <.link 
              navigate={~p"/"} 
              class="text-black hover:text-gray-700 transition-colors font-medium"
            >
              Inicio
            </.link>

            <!-- Dropdown de Productos -->
            <div class="relative group">
              <button class="flex items-center text-black hover:text-gray-700 transition-colors font-medium">
                Productos
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 ml-1" viewBox="0 0 20 20" fill="currentColor">
                  <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                </svg>
              </button>

              <!-- Menú desplegable -->
              <div class="absolute hidden group-hover:block bg-white text-black min-w-48 rounded-md shadow-lg z-10 left-1/2 transform -translate-x-1/2">
                <%= for product <- CoffeeShop.Products.list_products() do %>
                  <.link 
                    navigate={~p"/products/#{product.id}"}
                    class="block px-4 py-2 hover:bg-gray-100 transition-colors text-sm"
                  >
                    <%= product.name %>
                  </.link>
                <% end %>
              </div>
            </div>

            <!-- Botón de Contacto (actualizado para WhatsApp) -->
            <a 
              href="https://wa.me/56953348331?text=Hola,%20estoy%20en%20su%20web%20y%20necesito%20más%20información" 
              target="_blank"
              class="bg-gray-900 hover:bg-gray-800 text-white px-5 py-2 rounded-full transition-colors font-medium shadow hover:shadow-md"
            >
              Contáctanos
            </a>
          </div>

          <!-- Botón de menú móvil -->
          <div class="md:hidden flex items-center">
            <button 
              id="mobile-menu-button" 
              class="text-black focus:outline-none"
              phx-click="toggle_mobile_menu"
            >
              <svg class="h-8 w-8" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
              </svg>
            </button>
          </div>
        </div>
      </div>

      <!-- Menú móvil (oculto por defecto) -->
      <div 
        id="mobile-menu" 
        class="hidden md:hidden bg-[#fff100] shadow-lg transition-all duration-300 overflow-hidden"
      >
        <.link 
          navigate={~p"/"} 
          class="block py-3 px-6 text-black hover:bg-yellow-300 transition-colors font-medium border-b border-yellow-500"
        >
          Inicio
        </.link>
        
        <div class="border-b border-yellow-500">
          <button 
            class="w-full text-left py-3 px-6 text-black hover:bg-yellow-300 transition-colors font-medium flex justify-between items-center"
            phx-click="toggle_products_menu"
          >
            <span>Productos</span>
            <svg id="products-menu-arrow" class="h-5 w-5 transform transition-transform" viewBox="0 0 20 20" fill="currentColor">
              <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
            </svg>
          </button>
          <div id="products-menu-items" class="hidden bg-yellow-100">
            <%= for product <- CoffeeShop.Products.list_products() do %>
              <.link 
                navigate={~p"/products/#{product.id}"}
                class="block py-2 px-8 hover:bg-yellow-200 transition-colors text-sm"
              >
                <%= product.name %>
              </.link>
            <% end %>
          </div>
        </div>
        
        <!-- Botón de Contacto móvil (actualizado para WhatsApp) -->
        <a 
          href="https://wa.me/56953348331?text=Hola,%20estoy%20en%20su%20web%20y%20necesito%20más%20información" 
          target="_blank"
          class="block py-3 px-6 bg-gray-900 text-white hover:bg-gray-800 transition-colors font-medium"
        >
          Contáctanos
        </a>
      </div>
    </nav>

    <!-- Script para el comportamiento del navbar -->
    <script>
      // Efecto de scroll
      window.addEventListener('scroll', function() {
        const nav = document.getElementById('main-nav');
        if (window.scrollY > 20) {
          nav.classList.add('py-0');
          nav.classList.add('shadow-lg');
          nav.querySelector('img').classList.add('h-10');
          nav.querySelector('img').classList.remove('h-12');
        } else {
          nav.classList.remove('py-0');
          nav.classList.remove('shadow-lg');
          nav.querySelector('img').classList.remove('h-10');
          nav.querySelector('img').classList.add('h-12');
        }
      });

      // Menú hamburguesa
      document.getElementById('mobile-menu-button').addEventListener('click', function() {
        const menu = document.getElementById('mobile-menu');
        menu.classList.toggle('hidden');
      });

      // Menú de productos móvil
      document.querySelector('[phx-click="toggle_products_menu"]')?.addEventListener('click', function() {
        const items = document.getElementById('products-menu-items');
        const arrow = document.getElementById('products-menu-arrow');
        items.classList.toggle('hidden');
        arrow.classList.toggle('rotate-180');
      });
    </script>
    """
  end
end