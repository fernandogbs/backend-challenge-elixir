defmodule Ecommerce.CarrinhoTest do
  use Ecommerce.DataCase

  alias Ecommerce.Carrinho

  describe "items" do
    alias Ecommerce.Carrinho.Item

    import Ecommerce.CarrinhoFixtures

    @invalid_attrs %{description: nil, name: nil, price: nil}

    test "list_items/0 Retorna todos itens" do
      item = item_fixture()
      assert Carrinho.list_items() == [item]
    end

    test "get_item!/1 Retorna os valores de um item através do seu ID" do
      item = item_fixture()
      assert Carrinho.get_item!(item.id) == item
    end

    test "create_item/1 Cria um item com dados válidos" do
      valid_attrs = %{description: "some description", name: "some name", price: "120.5"}

      assert {:ok, %Item{} = item} = Carrinho.create_item(valid_attrs)
      assert item.description == "some description"
      assert item.name == "some name"
      assert item.price == Decimal.new("120.5")
    end

    test "create_item/1 Retorna erro de criação de item baseado nos @invalid_attrs" do
      assert {:error, %Ecto.Changeset{}} = Carrinho.create_item(@invalid_attrs)
    end

    test "update_item/2 Atualiza item com dados válidos" do
      item = item_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name", price: "456.7"}

      assert {:ok, %Item{} = item} = Carrinho.update_item(item, update_attrs)
      assert item.description == "some updated description"
      assert item.name == "some updated name"
      assert item.price == Decimal.new("456.7")
    end

    test "update_item/2 Retorna erro ao atualizar com @invalid_attrs" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Carrinho.update_item(item, @invalid_attrs)
      assert item == Carrinho.get_item!(item.id)
    end

    test "delete_item/1 Deleta o item do carrinho" do
      item = item_fixture()
      assert {:ok, %Item{}} = Carrinho.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Carrinho.get_item!(item.id) end
    end

    test "change_item/1 Retorna um item editado" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Carrinho.change_item(item)
    end
  end
end
