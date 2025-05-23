defmodule CoffeeShopWeb.Components.Layouts.Footer do
  use Phoenix.Component
  use CoffeeShopWeb, :verified_routes

  def footer(assigns) do
    ~H"""
    <footer class="bg-gray-900 text-gray-300 pt-12 pb-6 px-4 sm:px-6">
      <div class="max-w-7xl mx-auto">
        <!-- Contenido principal del footer -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8 mb-8">
          <!-- Logo vertical y descripción -->
          <div class="md:col-span-1 flex flex-col items-center md:items-start">
            <.link navigate={~p"/"} class="block mb-4">
              <img src={~p"/images/logo2.png"} alt="Coffee Shop Logo" class="h-48 w-auto object-contain" />
            </.link>
            <p class="text-sm text-gray-400 mb-4 text-center md:text-left font-poppins">
              Tu destino para el mejor café artesanal. Seleccionamos los granos más finos para tu experiencia perfecta.
            </p>
            <!-- Redes Sociales -->
            <div class="flex space-x-4">
              <a 
                href="https://www.tiktok.com/@prendecafe" 
                target="_blank"
                class="text-gray-400 hover:text-[#fff100] transition-colors"
              >
                <span class="sr-only">TikTok</span>
                <.icon name="fa-brands fa-tiktok" class="w-6 h-6" />
              </a>
              <a 
                href="https://www.instagram.com/prendecafe/" 
                target="_blank"
                class="text-gray-400 hover:text-[#fff100] transition-colors"
              >
                <span class="sr-only">Instagram</span>
                <.icon name="fa-brands fa-instagram" class="w-6 h-6" />
              </a>
              <a 
                href="mailto:contacto@prendecafe.cl" 
                class="text-gray-400 hover:text-[#fff100] transition-colors"
              >
                <span class="sr-only">Email</span>
                <.icon name="fa-solid fa-envelope" class="w-6 h-6" />
              </a>
            </div>
          </div>

          <!-- Productos -->
          <div class="flex flex-col items-center md:items-start">
            <h3 class="text-lg font-bebas font-semibold text-white mb-4 uppercase tracking-wide">Productos</h3>
            <ul class="space-y-2 text-center md:text-left">
              <%= for product <- CoffeeShop.Products.list_products() do %>
                <li>
                  <.link 
                    navigate={~p"/products/#{product.id}"}
                    class="text-gray-400 hover:text-[#fff100] transition-colors text-sm font-bebas uppercase tracking-wide"
                  >
                    <%= product.name %>
                  </.link>
                </li>
              <% end %>
            </ul>
          </div>

          <!-- Newsletter -->
          <div class="flex flex-col items-center md:items-start">
            <h3 class="text-lg font-bebas font-semibold text-white mb-4 text-center md:text-left uppercase tracking-wide">Newsletter</h3>
            <p class="text-sm text-gray-400 mb-3 text-center md:text-left font-poppins">
              Suscríbete para recibir promociones y novedades.
            </p>
            <form class="flex flex-col space-y-3 w-full md:w-auto">
              <input
                type="email"
                placeholder="Tu email"
                class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-md focus:outline-none focus:ring-1 focus:ring-[#fff100] text-sm w-full font-poppins"
                required
              />
              <button
                type="submit"
                class="bg-[#fff100] hover:bg-yellow-300 text-black font-bebas font-medium py-2 px-4 rounded-md transition-colors text-sm w-full md:w-auto uppercase tracking-wide"
              >
                Suscribirse
              </button>
            </form>
          </div>

          <!-- Horario + Botón Contacto -->
          <div class="flex flex-col items-center md:items-start">
            <div class="mb-6 w-full"> <!-- Ajuste de margen para alinear botones -->
              <h3 class="text-lg font-bebas font-semibold text-white mb-4 text-center md:text-left uppercase tracking-wide">Horario</h3>
              <ul class="space-y-2 text-sm text-gray-400 w-full text-center md:text-left font-poppins">
                <li class="flex justify-between md:justify-start md:space-x-4">
                  <span>Lunes - Viernes</span>
                  <span>7:00 - 20:00</span>
                </li>
                <li class="flex justify-between md:justify-start md:space-x-4">
                  <span>Sábado</span>
                  <span>8:00 - 22:00</span>
                </li>
                <li class="flex justify-between md:justify-start md:space-x-4">
                  <span>Domingo</span>
                  <span>9:00 - 18:00</span>
                </li>
              </ul>
            </div>

            <a 
              href="https://wa.me/56953348331?text=Hola,%20estoy%20en%20su%20web%20y%20necesito%20más%20información" 
              target="_blank"
              class="bg-[#fff100] hover:bg-yellow-300 text-black px-6 py-2 rounded-md transition-colors text-sm font-bebas font-medium w-full md:w-auto text-center uppercase tracking-wide"
            >
              Contáctanos
            </a>
          </div>
        </div>

        <!-- Footer inferior -->
        <div class="border-t border-gray-800 pt-6">
          <div class="flex flex-col md:flex-row justify-between items-center">
            <p class="text-xs text-gray-500 mb-4 md:mb-0 text-center md:text-left font-poppins">
              © 2025 PRENDE CAFE. Todos los derechos reservados.
            </p>
            <div class="flex flex-wrap justify-center space-x-4 text-xs">
              <.link 
                navigate={~p"/privacy"} 
                class="text-gray-500 hover:text-[#fff100] transition-colors font-poppins"
              >
                Política de Privacidad
              </.link>
              <.link 
                navigate={~p"/terms"} 
                class="text-gray-500 hover:text-[#fff100] transition-colors font-poppins"
              >
                Términos de Servicio
              </.link>
              <.link 
                navigate={~p"/cookies"} 
                class="text-gray-500 hover:text-[#fff100] transition-colors font-poppins"
              >
                Cookies
              </.link>
            </div>
          </div>
        </div>
      </div>
    </footer>
    """
  end

  attr :name, :string, required: true
  attr :class, :string, default: nil

  def icon(assigns) do
    ~H"""
    <i class={"#{@name} #{@class}"}></i>
    """
  end
end