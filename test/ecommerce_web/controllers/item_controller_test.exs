defmodule EcommerceWeb.ItemControllerTest do
  use EcommerceWeb.ConnCase

  import Ecommerce.CarrinhoFixtures

  @moduledoc """
  Testes para o controller ItemController
  Testes automáticos gerados com o mix:
  mix phx.gen.html Ecommerce Item items name:string description:text price:float
  """

  @create_attrs %{description: "some description", name: "some name", price: "120.5"}
  @update_attrs %{description: "some updated description", name: "some updated name", price: "456.7"}
  @invalid_attrs %{description: nil, name: nil, price: nil}

  describe "index" do
    test "lista todos os itens", %{conn: conn} do
      conn = get(conn, ~p"/items")
      assert html_response(conn, 200) =~ "Listing Items"
    end
  end

  describe "novo item" do
    test "renderiza formulário", %{conn: conn} do
      conn = get(conn, ~p"/items/new")
      assert html_response(conn, 200) =~ "New Item"
    end
  end

  describe "criar item" do
    test "redireciona após criar dados com atributos válidos", %{conn: conn} do
      conn = post(conn, ~p"/items", item: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/items/#{id}"

      conn = get(conn, ~p"/items/#{id}")
      assert html_response(conn, 200) =~ "Item #{id}"
    end

    test "exibe erros com dados invalidos @invalid_attrs", %{conn: conn} do
      conn = post(conn, ~p"/items", item: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Item"
    end
  end

  describe "editar item" do
    setup [:create_item]

    test "renderiza formulario de edição para item selecionado", %{conn: conn, item: item} do
      conn = get(conn, ~p"/items/#{item}/edit")
      assert html_response(conn, 200) =~ "Edit Item"
    end
  end

  describe "atualizar item" do
    setup [:create_item]

    test "redireciona após receber dados válido @update_attrs", %{conn: conn, item: item} do
      conn = put(conn, ~p"/items/#{item}", item: @update_attrs)
      assert redirected_to(conn) == ~p"/items/#{item}"

      conn = get(conn, ~p"/items/#{item}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renderiza erros de atribuição no formulário", %{conn: conn, item: item} do
      conn = put(conn, ~p"/items/#{item}", item: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Item"
    end
  end

  describe "deletar item" do
    setup [:create_item]

    test "deleta o item escolhido", %{conn: conn, item: item} do
      conn = delete(conn, ~p"/items/#{item}")
      assert redirected_to(conn) == ~p"/items"
    end
  end

  defp create_item(_) do
    item = item_fixture()
    %{item: item}
  end
end
