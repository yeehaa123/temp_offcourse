defmodule FixturesToDb.Mixfile do
  use Mix.Project

  def project do
    [app: :fixtures_to_db,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      mod: {FixturesToDb.App, []},
      applications: [:logger, :yamerl, :postgrex, :ecto]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
   [
     {:postgrex, ">= 0.0.0"},
     {:ecto, "~> 0.9.0"},
     {:yamerl, github: "yakaz/yamerl"}
   ]
  end
end
