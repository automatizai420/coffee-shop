defmodule CoffeeShopWeb.ProductHTML do
    use CoffeeShopWeb, :html
  
    embed_templates "product_html/*"
  
    def get_product_image(product) do
      case String.downcase(product.name) do
        "chocolate vainilla" -> ~p"/images/products/chocolate/desktop_paquete_chocolate.png"
        "flores silvestres" -> ~p"/images/products/flores/desktop_paquete_flores.png"
        "mango" -> ~p"/images/products/mango/desktop_paquete_mango.png"
        "chocolate caramelo" -> ~p"/images/products/caramelo/caramelo.png"
        _ -> ~p"/images/products/default.png"
      end
    end
  end