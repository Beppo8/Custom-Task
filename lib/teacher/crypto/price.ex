defmodule Teacher.Crypto.Price do
  use Ecto.Schema
  import Ecto.Changeset
  alias Teacher.Crypto.Coin

  schema "prices" do
    field :price, :float
    belongs_to :coin, Coin

    timestamps()
  end

  @doc false
  def changeset(price, attrs) do
    price
    |> cast(attrs, [:price])
    |> validate_required([:price])
  end
end
