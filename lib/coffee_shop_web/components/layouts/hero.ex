defmodule CoffeeShopWeb.Components.Layouts.Hero do
  use Phoenix.Component
  use CoffeeShopWeb, :verified_routes

  def hero(assigns) do
    ~H"""
    <section class="relative h-screen w-full bg-black" id="hero-top">
      <!-- Video de fondo -->
      <div class="absolute inset-0 z-0">
        <!-- Video para desktop -->
        <video
          autoplay
          loop
          muted
          playsinline
          class="hidden md:block absolute inset-0 w-full h-full object-cover"
        >
          <source src={~p"/images/web_desktop_hero_3.mp4"} type="video/mp4">
        </video>
        
        <!-- Video para móvil -->
        <video
          autoplay
          loop
          muted
          playsinline
          class="block md:hidden absolute inset-0 w-full h-full object-cover"
        >
          <source src={~p"/images/web_mobile_hero_3.mp4"} type="video/mp4">
        </video>
      </div>
      
        <!-- Contenido sobre el video -->
        <div class="relative z-10 h-full flex flex-col justify-end items-center text-center px-4 sm:px-6 lg:px-8 pb-20 md:pb-32">
        <div class="max-w-4xl mx-auto text-white">
          <!-- Título y subtítulo -->
          <p class="text-xl md:text-2xl mb-6 max-w-2xl mx-auto animate-fade-in delay-100 font-light">
            Selección premium de granos de café de las mejores regiones del mundo
          </p>
          
          <!-- Botón CTA con borde blanco -->
          <div class="animate-fade-in delay-200">
            <a
              href="#productos"
              class="inline-block bg-transparent border-2 border-white hover:bg-white hover:text-black text-white font-light py-3 px-10 rounded-full text-lg md:text-xl transition-all duration-300"
            >
              Explorar productos
            </a>
          </div>
        </div>
      </div>

      <!-- Flecha indicadora de scroll -->
      <div class="absolute bottom-10 left-1/2 transform -translate-x-1/2 z-10 animate-bounce">
        <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path>
        </svg>
      </div>
      
      <!-- Estilos de animación -->
      <style>
        @keyframes fadeIn {
          from { opacity: 0; transform: translateY(20px); }
          to { opacity: 1; transform: translateY(0); }
        }
        .animate-fade-in {
          animation: fadeIn 1s ease-out forwards;
        }
        .delay-100 {
          animation-delay: 0.3s;
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

    <!-- Banner estilizado debajo del video -->
    <div class="w-full bg-[#ffe44c] px-[5%]">
      <div class="max-w-7xl mx-auto">
        <div class="grid grid-cols-1 gap-y-5 py-12 md:grid-cols-2 md:gap-x-12 md:gap-y-8 lg:gap-x-20 lg:gap-y-16">
          <div>
            <h1 class="text-4xl font-bold text-black md:text-6xl lg:text-7xl">
              CONTÁCTANOS Y DESPIERTA TUS SENTIDOS
            </h1>
          </div>
          <div class="flex flex-col items-center md:items-start">
            <p class="text-lg text-black mt-4 mb-6 sm:text-xl">
              Te esperamos en nuestro WhatsApp para ofrecerte una experiencia personalizada. 
              Responderemos todas tus dudas y te mostraremos nuestras mejores selecciones de café.
            </p>
            <div class="w-full md:w-auto">
              <a
                href="https://wa.me/56953348331?text=Hola,%20me%20interesan%20sus%20productos%20de%20café"
                target="_blank"
                rel="noopener noreferrer"
                class="w-full md:w-auto border-2 border-black bg-transparent text-black hover:bg-black hover:text-[#ffe44c] rounded-full inline-flex items-center justify-center px-8 py-3 transition-all duration-300 text-lg font-medium"
              >
                Escríbenos por WhatsApp
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end