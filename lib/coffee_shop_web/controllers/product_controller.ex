defmodule CoffeeShopWeb.ProductController do
  use CoffeeShopWeb, :controller
  alias CoffeeShop.Products

  @whatsapp_number "56912345678" # Reemplaza con tu número real

  def show(conn, %{"id" => product_id}) do
    product = Products.get_product!(product_id)
    render(conn, :show, product: product, selected_size: "250g")
  end

  def select_size(conn, %{"size" => size, "id" => product_id}) do
    product = Products.get_product!(product_id)
    render(conn, :show, product: product, selected_size: size)
  end

  def submit_order(conn, %{"size" => size, "product_id" => product_id, "product_name" => product_name}) do
    product = Products.get_product!(product_id)
    price = if size == "250g", do: product.base_price_250g, else: product.base_price_500g
    
    whatsapp_message = """
    *NUEVO PEDIDO - CoffeeShop*
    
    Producto: #{product_name}
    Tamaño: #{size}
    Precio: $#{price}
    
    *Total a pagar: $#{price}*
    """

    whatsapp_url = "https://wa.me/#{@whatsapp_number}?text=#{URI.encode(whatsapp_message)}"
    redirect(conn, external: whatsapp_url)
  end
end