# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

if Mix.env() != "prod" do
  import_config "releases.exs"
end

# Configures the endpoint
config :enduro_backend, EnduroBackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Cs71iqKUOCTH8m9kZivsnF0BweaJVTthnW3XaMjfnUWp6u7pcCIOB+GXHgbKAqbW",
  render_errors: [view: EnduroBackendWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: EnduroBackend.PubSub,
  live_view: [signing_salt: "/UOZlJnM"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
