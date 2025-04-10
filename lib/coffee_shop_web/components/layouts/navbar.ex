defmodule CoffeeShopWeb.Components.Layouts.Navbar do
  use Phoenix.Component
  use CoffeeShopWeb, :verified_routes

  def navbar(assigns) do
    ~H"""
    <nav id="main-nav" class="bg-[#fff100] shadow-md fixed w-full transition-all duration-500 z-50 font-bebas">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-28 transition-all duration-500">
          <!-- Logo / Inicio -->
          <div class="flex items-center">
            <.link navigate={~p"/"} class="flex items-center space-x-2">
              <img src={~p"/images/logo.png"} alt="Logo" class="h-20 transition-all duration-500">
            </.link>
          </div>
  
          <!-- Menú principal (Desktop) - Textos reducidos -->
          <div class="hidden md:flex space-x-6 items-center">
            <.link 
              navigate={~p"/"} 
              class="text-black hover:text-gray-700 transition-colors font-medium tracking-wide text-lg"
            >
              Inicio
            </.link>
  
            <!-- Dropdown de Productos con texto reducido -->
            <div id="productos-dropdown" class="relative">
              <button id="productos-btn" class="flex items-center text-black hover:text-gray-700 transition-colors font-bebas font-medium uppercase tracking-wide text-lg">
                Productos
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 ml-1" viewBox="0 0 20 20" fill="currentColor">
                  <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                </svg>
              </button>
  
              <!-- Mega menú con productos más grandes -->
              <div id="mega-menu" class="fixed left-0 hidden bg-[#fff100] text-black w-full shadow-lg z-10 border-t border-yellow-400 opacity-0 transition-opacity duration-300" style="top: var(--navbar-height);">
                <!-- Área invisible para facilitar el hover -->
                <div class="h-4 w-full absolute -top-4 left-0"></div>
                
                <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
                  <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
                    <%= for product <- CoffeeShop.Products.list_products() do %>
                      <.link 
                        navigate={~p"/products/#{product.id}"}
                        class="bg-[#fff100] hover:bg-yellow-200 transition-colors h-full"
                      >
                        <div class="flex flex-col md:flex-row items-center p-4 gap-4 h-full">
                          <div class="min-w-20 h-20 bg-white rounded-md overflow-hidden flex items-center justify-center shadow-md flex-shrink-0">
                            <img 
                              src={CoffeeShopWeb.ProductHTML.get_product_image(product)} 
                              alt={"#{product.name}"} 
                              class="w-16 h-16 object-contain"
                            />
                          </div>
                          <div class="flex-1 w-full">
                            <h3 class="font-bold text-lg uppercase mb-1 text-center md:text-left"><%= product.name %></h3>
                            <p class="text-sm text-gray-700 uppercase line-clamp-2 md:h-10 w-full">
                              <%= case product.name do %>
                                <% "Chocolate Vainilla" -> %>
                                  NOTAS DE CHOCOLATE, VAINILLA Y CARAMELO
                                <% "Manzanilla" -> %>
                                  NOTAS DE MADERA NOBLE Y FLORES SILVESTRES
                                <% "Mango" -> %>
                                  MANGO, MIEL, MARACUYÁ, MADURO Y DULCE
                                <% "Chocolate Caramelo" -> %>
                                  NOTAS A MANGO, MIEL, CARAMELO, CHOCOLATE
                                <% _ -> %>
                                  <%= String.slice(product.description || "", 0, 50) %><%= if String.length(product.description || "") > 50, do: "...", else: "" %>
                              <% end %>
                            </p>
                          </div>
                        </div>
                      </.link>
                    <% end %>
                  </div>
                </div>
              </div>
            </div>
  
            <!-- Botón de Contacto con texto reducido -->
            <a 
              href="https://wa.me/56953348331?text=Hola,%20estoy%20en%20su%20web%20y%20necesito%20más%20información" 
              target="_blank"
              class="bg-gray-900 hover:bg-gray-800 text-white px-5 py-2 rounded-full transition-colors font-semibold shadow hover:shadow-md text-base"
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
        class="hidden md:hidden bg-[#fff100] shadow-lg transition-all duration-500 overflow-hidden"
      >
        <.link 
          navigate={~p"/"} 
          class="block py-3 px-6 text-black hover:bg-yellow-300 transition-colors font-medium tracking-wide border-b border-yellow-500"
        >
          Inicio
        </.link>
        
        <div class="border-b border-yellow-500">
          <button 
            class="w-full text-left py-3 px-6 text-black hover:bg-yellow-300 transition-colors font-medium tracking-wide flex justify-between items-center uppercase"
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
                class="block py-2 px-8 hover:bg-yellow-200 transition-colors text-sm font-semibold uppercase"
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
          class="block py-3 px-6 bg-gray-900 text-white hover:bg-gray-800 transition-colors font-semibold"
        >
          Contáctanos
        </a>
      </div>
    </nav> 

    <!-- Script para el comportamiento del navbar -->
    <script>
      // Función para actualizar el tamaño del navbar y establecer la variable CSS
      function updateNavbar() {
        const nav = document.getElementById('main-nav');
        const navContent = nav.querySelector('div > div');
        const logo = nav.querySelector('img');
        
        if (window.scrollY > 20) {
          // Cambia a navbar pequeño al hacer scroll
          navContent.classList.remove('h-28');
          navContent.classList.add('h-20');
          logo.classList.remove('h-20');
          logo.classList.add('h-12');
          nav.classList.add('shadow-lg');
          document.documentElement.style.setProperty('--navbar-height', '80px');
        } else {
          // Mantiene el navbar grande cuando está en la parte superior
          navContent.classList.remove('h-20');
          navContent.classList.add('h-28');
          logo.classList.remove('h-12');
          logo.classList.add('h-20');
          nav.classList.remove('shadow-lg');
          document.documentElement.style.setProperty('--navbar-height', '112px');
        }
      }

      // Inicializar la variable CSS para el posicionamiento del mega menú
      document.documentElement.style.setProperty('--navbar-height', window.scrollY > 20 ? '80px' : '112px');
      
      // Efecto de scroll
      window.addEventListener('scroll', updateNavbar);

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
      
      // Asegurar que el navbar comience grande al cargar la página
      window.addEventListener('DOMContentLoaded', updateNavbar);
      
      // Mejorar el comportamiento del menú desplegable
      document.addEventListener('DOMContentLoaded', function() {
        const dropdown = document.getElementById('productos-dropdown');
        const megaMenu = document.getElementById('mega-menu');
        const productosBtn = document.getElementById('productos-btn');
        let timeoutId = null;

        // Funciones para mostrar y ocultar con retraso
        function showMenu() {
          clearTimeout(timeoutId); // Limpiar cualquier tiempo de espera anterior
          megaMenu.classList.remove('hidden');
          // Pequeño retraso para la animación
          setTimeout(() => {
            megaMenu.classList.add('opacity-100');
            megaMenu.classList.remove('opacity-0');
          }, 50);
        }

        function hideMenuWithDelay() {
          clearTimeout(timeoutId);
          timeoutId = setTimeout(() => {
            megaMenu.classList.remove('opacity-100');
            megaMenu.classList.add('opacity-0');
            // Esperar a que termine la transición antes de ocultar
            setTimeout(() => {
              megaMenu.classList.add('hidden');
            }, 300);
          }, 200); // 200ms de retraso antes de comenzar a ocultar
        }

        // Eventos para el botón de Productos
        productosBtn.addEventListener('mouseenter', showMenu);
        productosBtn.addEventListener('mouseleave', hideMenuWithDelay);

        // Eventos para el megaMenu
        megaMenu.addEventListener('mouseenter', showMenu);
        megaMenu.addEventListener('mouseleave', hideMenuWithDelay);
        
        // Asegurar que todos los elementos del mega menu tengan la misma altura
        function equalizeProductCards() {
          const productLinks = megaMenu.querySelectorAll('.grid > a');
          let maxHeight = 0;
          
          // Primero, restablecer alturas
          productLinks.forEach(link => {
            link.style.height = 'auto';
          });
          
          // Encontrar la altura máxima
          productLinks.forEach(link => {
            maxHeight = Math.max(maxHeight, link.offsetHeight);
          });
          
          // Aplicar la altura máxima a todos
          if (maxHeight > 0) {
            productLinks.forEach(link => {
              link.style.height = `${maxHeight}px`;
            });
          }
        }
        
        // Ejecutar al cargar y al cambiar el tamaño de la ventana
        window.addEventListener('load', equalizeProductCards);
        window.addEventListener('resize', equalizeProductCards);
      });
    </script>
    """
  end
end