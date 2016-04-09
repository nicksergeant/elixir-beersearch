defmodule BeerSearch.Mixfile do
  use Mix.Project

  def project do
    [app: :beersearch,
     build_embedded: Mix.env == :prod,
     deps: deps,
     description: "A simple Elixir module that searches for beers on Untappd.",
     elixir: "~> 1.2",
     escript: [main_module: BeerSearch],
     licenses: ["MIT"],
     links: %{
       "GitHub" => "https://github.com/nicksergeant/elixir-beersearch"
     },
     maintainers: ["Nick Sergeant"],
     package: package,
     start_permanent: Mix.env == :prod,
     version: "0.0.3"]
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
