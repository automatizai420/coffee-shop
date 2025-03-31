document.addEventListener("DOMContentLoaded", function() {
    const initWhatsAppPopup = () => {
      const container = document.getElementById("whatsapp-container");
      const popup = document.getElementById("whatsapp-popup");
      const button = document.getElementById("whatsapp-button");
      
      if (!container || !popup || !button) {
        console.error("Elementos del popup no encontrados!");
        return;
      }
      
      // Mostrar después de 2 segundos
      setTimeout(() => {
        popup.classList.remove("opacity-0", "translate-y-4");
        popup.classList.add("opacity-100", "translate-y-0");
        
        // Ocultar después de 10 segundos (tiempo aumentado)
        setTimeout(() => {
          popup.classList.remove("opacity-100", "translate-y-0");
          popup.classList.add("opacity-0", "translate-y-4");
        }, 6000); // 10 segundos en lugar de 5
      }, 2000);
      
      // Mostrar el popup nuevamente al pasar el mouse sobre el botón
      button.addEventListener("mouseenter", () => {
        popup.classList.remove("opacity-0", "translate-y-4");
        popup.classList.add("opacity-100", "translate-y-0");
      });
      
      // Ocultar cuando el mouse sale del botón después de 3 segundos
      button.addEventListener("mouseleave", () => {
        setTimeout(() => {
          popup.classList.remove("opacity-100", "translate-y-0");
          popup.classList.add("opacity-0", "translate-y-4");
        }, 3000);
      });
    };
    
    initWhatsAppPopup();
  });
  