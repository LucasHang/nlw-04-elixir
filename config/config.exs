# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :nlw_elixir_payday,
  ecto_repos: [NlwElixirPayday.Repo]

# Configures the endpoint
config :nlw_elixir_payday, NlwElixirPaydayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+ODsPkqUV8huz3hVaJu8DRN8rME6bNmpiXZcVFBZTnNfXEV/hpp1muIjgfDIl3Z5",
  render_errors: [view: NlwElixirPaydayWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: NlwElixirPayday.PubSub,
  live_view: [signing_salt: "AgNfZHle"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
