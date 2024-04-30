defmodule EcommerceWeb.ItemController do
  use EcommerceWeb, :controller

  alias Ecommerce.Carrinho
  alias Ecommerce.Carrinho.Item

  def index(conn, _params) do
    items = Carrinho.list_items()
    render(conn, :index, items: items)
  end

  def new(conn, _params) do
    changeset = Carrinho.change_item(%Item{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"item" => item_params}) do
    case Carrinho.create_item(item_params) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item adicionado.")
        |> redirect(to: ~p"/items/#{item}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    item = Carrinho.get_item!(id)
    render(conn, :show, item: item)
  end

  def edit(conn, %{"id" => id}) do
    item = Carrinho.get_item!(id)
    changeset = Carrinho.change_item(item)
    render(conn, :edit, item: item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Carrinho.get_item!(id)

    case Carrinho.update_item(item, item_params) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item atualizado.")
        |> redirect(to: ~p"/items/#{item}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, item: item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Carrinho.get_item!(id)
    {:ok, _item} = Carrinho.delete_item(item)

    conn
    |> put_flash(:info, "Item deletado.")
    |> redirect(to: ~p"/items")
  end
end
