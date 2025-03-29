# Coffee Shop - Proyecto Phoenix

Proyecto de tienda de café especial con Phoenix 1.7

## Requisitos
- Elixir 1.14+
- Erlang/OTP 25+
- PostgreSQL
- Node.js 16+ (para assets)

## Instalación
```bash
mix deps.get
mix ecto.setup
npm install --prefix assets
```

## Ejecutar
```bash
mix phx.server
```

Visita http://localhost:4000