defmodule ExEcho do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    port = Application.get_env(:ex_echo, :cowboy_port, 5000)

    # Define workers and child supervisors to be supervised
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, ExEcho.Plug.Router, [], port: port)
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExEcho.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
