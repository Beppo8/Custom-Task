defmodule Teacher.Repo.Migrations.CreatePrices do
  use Ecto.Migration

  def change do
    create table(:prices) do
      add :price, :float
      add :coin_id, references(:coins, on_delete: :delete_all)

      timestamps()
    end

    create index(:prices, [:coin_id])
  end
end
