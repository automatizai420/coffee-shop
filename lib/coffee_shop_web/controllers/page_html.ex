defmodule CoffeeShopWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use CoffeeShopWeb, :html
  
  import CoffeeShopWeb.Components.UI.ProductCard


  embed_templates "page_html/*"
end
