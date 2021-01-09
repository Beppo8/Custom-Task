defmodule Teacher.Crypto.Coin do
  use Ecto.Schema
  import Ecto.Changeset
  alias Teacher.Crypto.Price

  schema "coins" do
    field :name, :string
    field :api_id, :string
    has_many :prices, Teacher.Crypto.Price

    timestamps()
  end

  @doc false
  def changeset(coin, attrs) do
    coin
    |> cast(attrs, [:name, :api_id])
    |> validate_required([:name, :api_id])
  end
end
