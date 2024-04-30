defmodule Ecommerce.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :description, :text
      add :price, :decimal

      timestamps(type: :utc_datetime)
    end
  end
end
