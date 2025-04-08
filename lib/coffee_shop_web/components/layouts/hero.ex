defmodule CoffeeShopWeb.Components.Layouts.Hero do
  use Phoenix.Component
  use CoffeeShopWeb, :verified_routes

  def hero(assigns) do
    ~H"""
    <section class="relative h-screen w-full bg-black" id="hero-top">
      <!-- Video de fondo -->
      <div class="absolute inset-0 z-0">
        <!-- Video para desktop -->
        <video autoplay loop muted playsinline class="hidden md:block absolute inset-0 w-full h-full object-cover">
          <source src={~p"/images/web_desktop_hero_3.mp4"} type="video/mp4">
        </video>
        
        <!-- Video para móvil -->
        <video autoplay loop muted playsinline class="block md:hidden absolute inset-0 w-full h-full object-cover">
          <source src={~p"/images/web_mobile_hero_3.mp4"} type="video/mp4">
        </video>
      </div>
      
      <!-- Contenido sobre el video -->
      <div class="relative z-10 h-full flex flex-col justify-end items-center text-center px-4 sm:px-6 lg:px-8 pb-20 md:pb-32">
        <div class="max-w-4xl mx-auto text-white">
          <!-- Botón CTA -->
          <div class="animate-fade-in delay-200">
            <a href="#productos" class="inline-block bg-transparent border-2 border-white hover:bg-white hover:text-black text-white font-poppins font-semibold py-3 px-10 rounded-full text-lg md:text-xl uppercase transition-all duration-300">
              Explorar productos
            </a>
          </div>
        </div>
      </div>

      <!-- Flecha indicadora -->
      <div class="absolute bottom-10 left-1/2 transform -translate-x-1/2 z-10 animate-bounce">
        <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path>
        </svg>
      </div>
      
      <!-- Estilos -->
      <style>
        @keyframes fadeIn {
          from { opacity: 0; transform: translateY(20px); }
          to { opacity: 1; transform: translateY(0); }
        }
        .animate-fade-in {
          animation: fadeIn 1s ease-out forwards;
        }
        .delay-200 {
          animation-delay: 0.6s;
        }
        @keyframes bounce {
          0%, 20%, 50%, 80%, 100% { transform: translateY(0) translateX(-50%); }
          40% { transform: translateY(-20px) translateX(-50%); }
          60% { transform: translateY(-10px) translateX(-50%); }
        }
        .animate-bounce {
          animation: bounce 2s infinite;
        }
      </style>
    </section>
    """
  end
end