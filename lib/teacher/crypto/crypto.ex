defmodule Teacher.Crypto do
  @moduledoc """
  The Crypto context.
  """

  import Ecto.Query, warn: false
  alias Teacher.Repo

  alias Teacher.Crypto.{Coin, Price}
  alias Teacher.Crypto.CoinData

  def write_price(id) do
    coin = get_coin!(id)
    price = CoinData.fetch_price(coin.api_id)

    coin
    |> Ecto.build_assoc(:prices, %{price: price})
    |> Repo.insert()
  end

  @doc """
  Returns the list of coins.

  ## Examples

      iex> list_coins()
      [%Coin{}, ...]

  """
  def list_coins do
    Repo.all(Coin)
  end

  @doc """
  Gets a single coin.

  Raises `Ecto.NoResultsError` if the Coin does not exist.

  ## Examples

      iex> get_coin!(123)
      %Coin{}

      iex> get_coin!(456)
      ** (Ecto.NoResultsError)

  """
  def get_coin!(id) do
    Coin
    |> Repo.get!(id)
    |> Repo.preload([prices: (from price in Price, order_by: [desc: price.inserted_at])])
  end

  def coin_by_api_id!(api_id) do
    Coin
    |> Repo.get_by!(api_id: api_id)
  end

  @doc """
  Creates a coin.

  ## Examples

      iex> create_coin(%{field: value})
      {:ok, %Coin{}}

      iex> create_coin(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_coin(attrs \\ %{}) do
    %Coin{}
    |> Coin.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a coin.

  ## Examples

      iex> update_coin(coin, %{field: new_value})
      {:ok, %Coin{}}

      iex> update_coin(coin, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_coin(%Coin{} = coin, attrs) do
    coin
    |> Coin.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Coin.

  ## Examples

      iex> delete_coin(coin)
      {:ok, %Coin{}}

      iex> delete_coin(coin)
      {:error, %Ecto.Changeset{}}

  """
  def delete_coin(%Coin{} = coin) do
    Repo.delete(coin)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking coin changes.

  ## Examples

      iex> change_coin(coin)
      %Ecto.Changeset{source: %Coin{}}

  """
  def change_coin(%Coin{} = coin) do
    Coin.changeset(coin, %{})
  end
end
