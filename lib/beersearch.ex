defmodule BeerSearch do
  def search(query) do
    query
      |> results
      |> beers
      |> ratings
  end

  defp beers(response) do
    Floki.find(response, ".beer-item")
  end

  defp ratings(beers) do
    Enum.map beers, fn(beer) ->
      name = Floki.find(beer, "p.name a") |> Floki.text
      brewery = Floki.find(beer, "p.brewery a") |> Floki.text
      rating = Floki.find(beer, "p.rating span.num") |> Floki.text
      "#{brewery} #{name} #{rating}"
    end
  end

  defp results(query) do
    query = URI.encode query
    HTTPotion.get("https://untappd.com/search?q=#{query}&type=beer&sort=").body
  end
end
