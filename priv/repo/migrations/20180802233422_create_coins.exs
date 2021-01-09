defmodule Teacher.Repo.Migrations.CreateCoins do
  use Ecto.Migration

  def change do
    create table(:coins) do
      add :name, :string
      add :api_id, :string

      timestamps()
    end

  end
end
