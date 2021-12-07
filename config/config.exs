# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :readgithubapi,
  ecto_repos: [Readgithubapi.Repo]

# Configures the endpoint
config :readgithubapi, ReadgithubapiWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: ReadgithubapiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Readgithubapi.PubSub,
  live_view: [signing_salt: "dgy1x8/s"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
