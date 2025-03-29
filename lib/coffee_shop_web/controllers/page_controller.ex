defmodule CoffeeShopWeb.PageController do
  use CoffeeShopWeb, :controller

  def home(conn, _params) do
    products = CoffeeShop.Products.list_products()
    render(conn, :home, products: products, show_hero: true, page_title: "Inicio")
  end

  def contact(conn, _params) do
    render(conn, :contact)
  end
end
