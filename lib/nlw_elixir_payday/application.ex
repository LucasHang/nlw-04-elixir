defmodule NlwElixirPayday.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      NlwElixirPayday.Repo,
      # Start the Telemetry supervisor
      NlwElixirPaydayWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: NlwElixirPayday.PubSub},
      # Start the Endpoint (http/https)
      NlwElixirPaydayWeb.Endpoint
      # Start a worker by calling: NlwElixirPayday.Worker.start_link(arg)
      # {NlwElixirPayday.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NlwElixirPayday.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    NlwElixirPaydayWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
