defmodule Ecommerce.CarrinhoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ecommerce.Carrinho` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        price: "120.5"
      })
      |> Ecommerce.Carrinho.create_item()

    item
  end
end
