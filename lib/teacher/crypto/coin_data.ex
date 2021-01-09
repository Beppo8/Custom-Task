defmodule Teacher.Crypto.CoinData  do

  def fetch_price(id) do
    id
    |> String.upcase()
    |> url()
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()
    |> Map.get("price")
  end

  defp url(id) do
    "http://coincap.io/page/" <> id
  end

end
