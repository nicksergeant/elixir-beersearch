defmodule BeerSearch.Mixfile do
  use Mix.Project

  def project do
    [app: :beersearch,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:httpotion, :logger]]
  end

  defp deps do
    [
      {:floki, "~> 0.8"},
      {:httpotion, "~> 2.2.0"}
    ]
  end
end
