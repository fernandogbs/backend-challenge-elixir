defmodule Ecommerce.Carrinho.Item do
  @moduledoc """
  O módulo `Ecommerce.Carrinho.Item` representa um item no carrinho de compras na aplicação Ecommerce.
  Ele usa Ecto para mapeamento de dados e validações de changeset.
  """

  use Ecto.Schema
  import Ecto.Changeset

  @doc """
  Define o esquema para a tabela `items` no banco de dados.

  O esquema inclui os seguintes campos:
  - `:description`: uma string que descreve o item
  - `:name`: uma string que representa o nome do item
  - `:price`: um decimal que representa o preço do item
  """
  schema "items" do
    field :description, :string
    field :name, :string
    field :price, :decimal

    timestamps(type: :utc_datetime)
  end

  @doc """
  A função `changeset/2` é usada para validar e rastrear mudanças nos dados do item.

  Ela recebe dois argumentos:
  - `item`: a estrutura de dados atual do item
  - `params`: um mapa com as mudanças propostas para o item
  A função retorna um changeset que pode ser usado para atualizar o item no banco de dados.
  """
  def changeset(item, params) do
    item
    |> cast(params, [:name, :description, :price])
    |> validate_required([:name, :description, :price])
  end
end
