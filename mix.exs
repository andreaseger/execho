defmodule ExEcho.Mixfile do
  use Mix.Project

  def project do
    [app: :ex_echo,
     version: "0.3.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :cowboy, :plug],
     mod: {ExEcho, []}]
  end

  defp deps do
    [{:cowboy, "~> 1.0.4"},
     {:plug, "~> 1.3"},
     {:distillery, "~> 1.0"}
    ]
  end
end
