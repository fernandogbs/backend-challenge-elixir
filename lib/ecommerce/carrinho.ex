defmodule Ecommerce.Carrinho do
  @moduledoc """
  Carrinho de Ecommerce
  """

  import Ecto.Query, warn: false
  alias Ecommerce.Repo

  alias Ecommerce.Carrinho.Item

  @doc """
  Retorna uma lista de itens.

  ## Exemplos de uso

      iex> list_items()
      [%Item{}, ...]

  """
  def list_items do
    Repo.all(Item)
  end

  @doc """
  Obtem um unico objeto pelo id.

  Retorna `Ecto.NoResultsError` se o objeto não existir.

  ## Examplos

      iex> get_item!(123)
      %Item{}

      iex> get_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item!(id), do: Repo.get!(Item, id)

  @doc """
  Cria um item

  ## Examplos

      iex> create_item(%{field: value})
      {:ok, %Item{}}

      iex> create_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Atualiza um item.

  ## Exemplos

      iex> update_item(item, %{field: new_value})
      {:ok, %Item{}}

      iex> update_item(item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end


  @doc """
  Exclui um item.

  ## Exemplos

      iex> delete_item(item)
      {:ok, %Item{}}

      iex> delete_item(item)
      {:error, %Ecto.Changeset{}}
  """
  def delete_item(%Item{} = item) do
    Repo.delete(item)
  end

  @doc """
  Retorna um `%Ecto.Changeset{}` para mapear as modificações feitas no objeto.

  ## Examplos

      iex> change_item(item)
      %Ecto.Changeset{data: %Item{}}

  """
  def change_item(%Item{} = item, attrs \\ %{}) do
    Item.changeset(item, attrs)
  end
end
