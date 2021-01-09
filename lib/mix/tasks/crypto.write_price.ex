defmodule Mix.Tasks.Crypto.WritePrice do
  use Mix.Task
  alias Teacher.{Repo, Crypto}

  @shortdoc "Fetches the current price of a cryptocurrency and saves it"
  @moduledoc """
    Fetches the current price of a cryptocurrency and saves it.

      mix crypto.write_price

  ## Examples

      To save the current price of a Bitcoin

        mix crypto.write_price btc

      You can also save the price for many coins at once

        mix crypto.write_price eth btc
  """

  def run(args) do
    Mix.Ecto.ensure_started(Repo, [])
    Application.ensure_all_started(:httpoison)

    for api_id <- args do
      coin = Crypto.coin_by_api_id!(api_id)
      Crypto.write_price(coin.id)
    end
  end

end
