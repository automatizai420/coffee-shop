defmodule CoffeeShop.Products do
  def list_products do
    [
      %{
        id: "chocolate-vainilla",
        name: "Chocolate Vainilla",
        description: "Una fiel expresión del clásico cacao brasileño, con delicadas notas aromáticas a caramelo. Tiene esa vibra cálida que no solo despierta, también acompaña.",
        barista_recommendation: "☕ El barista recomienda:\nPerfecto para preparaciones con leche. Su perfil dulce y balanceado se adapta con facilidad a distintos estilos, manteniendo siempre su carácter. Desde el clásico Latte, Capuccino, hasta tu versión con leche de avena, almendra o lo que quieras. La idea es que lo hagas tuyo.",
        profile_description: "Aromático, suave y envolvente, es ideal para quienes buscan algo más que energía: una excusa para pausar, una buena conversación o ese momento donde todo empieza a fluir.",
        base_price_250g: 16000,
        base_price_500g: 23000,
        review_count: 10
      },
      %{
        id: "manzanilla",
        name: "MANZANILLA",
        description: "Café de especialidad caracterizado por sus notas de madera, manzanilla y flores. Suave, floral, y con esa dulzura sutil que te abraza. Directo desde las colinas de Alta Mogiana, Brasil, donde el café se cultiva con historia, paciencia y amor por la tierra, seleccionamos granos únicos que despiertan los sentidos con suavidad.",
        barista_recommendation: "☕ El barista recomienda:\nEste café se luce en métodos suaves como la prensa francesa, la V60 o el Aeropress. Ahí es donde realmente se despliegan sus notas florales y esa dulzura sutil que lo hace tan especial. Ideal para quienes buscan más que energía: una experiencia cálida, envolvente y llena de matices.",
        profile_description: "Una invitación a bajar el ritmo. Su perfil floral y dulce acompaña momentos de pausa, silencio, y reconexión. No es un café que golpea. Es uno que te abraza. Que prende despacio, pero deja huella",
        base_price_250g: 16000,
        base_price_500g: 23000,
        review_count: 11
      },
      %{
        id: "mango",
        name: "MANGO",
        description: "Este café es pura frescura con carácter. En cada sorbo se asoma una nota jugosa a mango, redondeada por una acidez brillante y un final que deja espacio para la inspiración. Es café de especialidad, pero sin rodeos: directo desde Brasil, con la calidad de siempre y la vibra que se necesita para empezar con todo.",
        barista_recommendation: "☕ El barista recomienda:\nExcelente en métodos filtrados como V60 o Chemex, donde se luce su perfil frutal y refrescante. Ideal para sesiones de trabajo creativo o mañanas que necesitan un buen impulso.",
        profile_description: "Para los que quieren energía, pero también creatividad. Para quienes no se conforman con lo mismo de siempre y buscan un café con personalidad, sabor y propósito.",
        base_price_250g: 16000,
        base_price_500g: 23000,
        review_count: 17
      },
      %{
        id: "chocolate-caramelo",
        name: "Chocolate Caramelo",
        description: "Este café es pura sinergia: mango, miel, caramelo y chocolate conviven en una taza con carácter, pero equilibrado. Un blend trabajado con fermentación controlada y secado natural, pensado para entregar un perfil armónico, estructurado y con una acidez media que despierta sin abrumar.",
        barista_recommendation: "☕ El barista recomienda:\nFunciona increíble en espresso o moka, donde se intensifica su complejidad. También puedes explorarlo en frío si lo que buscas es una explosión más refrescante pero igual de envolvente.",
        profile_description: "Es un café que se atreve a mezclar lo mejor de varios mundos. Dulce pero con fuerza, frutal pero balanceado. Ideal para quienes ven el café como un ritual de poder: para saltar de una idea a otra, para transformar el cansancio en foco, y para disfrutar el proceso.",
        base_price_250g: 12500,
        base_price_500g: 23000,
        review_count: 10
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