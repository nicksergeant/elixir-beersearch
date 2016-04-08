defmodule BeerSearch.Mixfile do
  use Mix.Project

  def project do
    [app: :beersearch,
     version: "0.0.2",
     description: "A simple Elixir module that searches for beers on Untappd.",
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

  defp package do
    %{
      maintainers: ["Nick Sergeant"],
      licenses: ["MIT"],
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      links: %{
        "GitHub" => "https://github.com/nicksergeant/elixir-beersearch"
      }
    }
  end
end
