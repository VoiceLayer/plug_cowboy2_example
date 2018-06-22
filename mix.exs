defmodule PlugCowboy2Example.Mixfile do
  use Mix.Project

  def project do
    [
      app: :plug_cowboy2_example,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {PlugCowboy2Example, []}
    ]
  end

  defp deps do
    [
      {:cowboy, "~> 2.4.0"},
      {:plug, "~> 1.6.0"},
    ]
  end
end
