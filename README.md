# elixir-beersearch

A simple Elixir module that searches for beers on [Untappd](https://untappd.com/).

## Installation for CLI usage

1. `brew install erlang`
2. `git clone https://github.com/nicksergeant/elixir-beersearch.git`
3. `ln -s $PWD/elixir-beersearch/beersearch /usr/local/bin/beersearch`
4. `beersearch dogfish 60`

## Installation as a module

Add `beersearch` to your dependencies and application config in `mix.exs`:

```elixir
defp deps do
  [
    {:beersearch, "~> 0.0.2"}
  ]
end

def application do
  [applications: [:beersearch, :logger]]
end
```

Then run `mix deps.get`.

## Usage

`BeerSearch.search("Dogfish 60")`

Output:

```
[%{abv: "6% ABV", brewery: "Dogfish Head Craft Brewery", ibu: "60 IBU",
   image: "https://untappd.akamaized.net/site/beer_logos/beer-3952_a5c9d_sm.jpeg",
   name: "60 Minute IPA", rating: "3.896", style: "IPA - American",
   url: "https://untappd.com/b/dogfish-head-craft-brewery-60-minute-ipa/3952"},
 %{abv: "6% ABV", brewery: "Mike's Tallybrew", ibu: "N/A IBU",
   image: "https://untappd.akamaized.net/site/beer_logos/beer-1131483_de29d_sm.jpeg",
   name: "DogFishSkull 60", rating: "0", style: "Homebrew  |  IPA - American",
   url: "https://untappd.com/beer/1131483"},
 %{abv: "6% ABV", brewery: "Rambling Ridge Brewery", ibu: "60 IBU",
   image: "https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png",
   name: "DogFish 60 Clone", rating: "0",
   style: "Homebrew  |  IPA - American",
   url: "https://untappd.com/beer/1296192"},
 %{abv: "6% ABV", brewery: "Alchemist Brewery", ibu: "120 IBU",
   image: "https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png",
   name: "Clone Dogfish Head 60 Minute", rating: "0",
   style: "Homebrew  |  IPA - American",
   url: "https://untappd.com/beer/1465470"}]
```
