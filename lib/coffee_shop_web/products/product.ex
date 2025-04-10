defmodule CoffeeShop.Products.Product do
  defstruct [
    :id, 
    :name, 
    :description, 
    :base_price_250g, 
    :base_price_500g, 
    :price,
    :review_count,
    :barista_recommendation,  # Nuevo campo
    :profile_description     # Nuevo campo
  ]
end