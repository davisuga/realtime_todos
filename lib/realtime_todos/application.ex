defmodule RealtimeTodos.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      RealtimeTodos.Repo,
      # Start the Telemetry supervisor
      RealtimeTodosWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: RealtimeTodos.PubSub},
      # Start the Endpoint (http/https)
      RealtimeTodosWeb.Endpoint
      # Start a worker by calling: RealtimeTodos.Worker.start_link(arg)
      # {RealtimeTodos.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RealtimeTodos.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RealtimeTodosWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
