defmodule Ecommerce.Carrinho.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :description, :string
    field :name, :string
    field :price, :decimal

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item, params) do
    item
    |> cast(params, [:name, :description, :price])
    |> validate_required([:name, :description, :price])
  end
end
