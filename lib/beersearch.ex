defmodule BeerSearch do
  def search(query) do
    query
      |> results
      |> beers
      |> ratings
  end

  def main(args) do
    case args do
      [] -> IO.puts "No query provided. Do 'beersearch dogfish 60'."
      _  ->
        args
          |> Enum.join(" ")
          |> search
          |> Enum.join("\n")
          |> IO.puts
    end
  end

  defp beers(response) do
    Floki.find(response, ".beer-item")
  end

  defp ratings(beers) do
    Enum.map beers, fn(beer) ->
      abv = Floki.find(beer, "p.abv")
        |> Floki.text
        |> String.strip

      brewery = Floki.find(beer, "p.brewery a")
        |> Floki.text

      ibu = Floki.find(beer, "p.ibu")
        |> Floki.text
        |> String.strip

      image = Floki.find(beer, "a.label img")
        |> Floki.attribute("src")
        |> hd

      name = Floki.find(beer, "p.name a")
        |> Floki.text

      url = Floki.find(beer, "p.name a")
        |> Floki.attribute("href")
        |> (&("https://untappd.com#{&1}")).()

      rating = Floki.find(beer, "p.rating span.num")
        |> Floki.text
        |> String.replace("(", "")
        |> String.replace(")", "")

      style = Floki.find(beer, "p.style")
        |> Floki.text

      %{
        abv: abv,
        name: name,
        brewery: brewery,
        ibu: ibu,
        image: image,
        rating: rating,
        style: style,
        url: url,
      }
    end
  end

  defp results(query) do
    HTTPotion.get("https://untappd.com/search?q=#{URI.encode(query)}&type=beer&sort=").body
  end
end
