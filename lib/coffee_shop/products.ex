defmodule CoffeeShop.Products do
  def list_products do
    [
      %{
        id: "chocolate-vainilla",
        name: "Chocolate Vainilla",
        description: "Chocolate de leche, Vainilla y Caramelo...",
        base_price_250g: 16000,
        base_price_500g: 23000
      },
      %{
        id: "flores-silvestres",
        name: "Flores Silvestres",
        description: "Madera, Manzanilla, Flores...",
        base_price_250g: 16000,
        base_price_500g: 23000
      },
        %{
          id: "mango",
          name: "Mango",
          description: "Mango, Miel, maracuyá maduro. Cuerpo jugoso y gentil, como tarde de primavera. En las colinas de Alta Mogiana, Brasil.",
          base_price_250g: 16000,
          base_price_500g: 23000
        },
        %{
          id: "chocolate-caramelo",
          name: "Chocolate Caramelo",
          description: "Notas a Mango, Miel, Caramelo, Chocolate. De cuerpo estructurado y armonioso. Variedad: blend. Fermentación Controlada y Secado Natural. Acidez: Media.",
          base_price_250g: 16000,
          base_price_500g: 23000
        }
      ]
    end
  
    def get_product!(id) do
      Enum.find(list_products(), fn product -> product.id == id end)
    end
  
    def get_price(product, size) when size in ["250g", "500g"] do
      case size do
        "250g" -> product.base_price_250g
        "500g" -> product.base_price_500g
      end
    end
  end