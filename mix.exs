defmodule PlugCowboy2Example.Mixfile do
  use Mix.Project

  def project do
    [app: :plug_cowboy2_example,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :ranch, :cowlib, :cowboy, :plug, :plug_cowboy2],
     mod: {PlugCowboy2Example, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:plug_cowboy2, github: "voicelayer/plug_cowboy2"},
     {:ranch, github: "ninenines/ranch", ref: "1.3.0", override: true},
     {:cowlib, github: "ninenines/cowlib", ref: "master", override: true},
     {:plug, "~> 1.3.0"},
     {:cowboy, github: "ninenines/cowboy", ref: "2.0.0-pre.4", override: true}]

  end
end
