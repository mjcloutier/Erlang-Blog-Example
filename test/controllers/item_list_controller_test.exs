defmodule Blog.ItemListControllerTest do
  use Blog.ConnCase

  alias Blog.ItemList
  @valid_attrs %{items: "some content", name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, item_list_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    item_list = Repo.insert! %ItemList{}
    conn = get conn, item_list_path(conn, :show, item_list)
    assert json_response(conn, 200)["data"] == %{"id" => item_list.id,
      "name" => item_list.name,
      "items" => item_list.items}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, item_list_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, item_list_path(conn, :create), item_list: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(ItemList, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, item_list_path(conn, :create), item_list: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    item_list = Repo.insert! %ItemList{}
    conn = put conn, item_list_path(conn, :update, item_list), item_list: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(ItemList, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    item_list = Repo.insert! %ItemList{}
    conn = put conn, item_list_path(conn, :update, item_list), item_list: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    item_list = Repo.insert! %ItemList{}
    conn = delete conn, item_list_path(conn, :delete, item_list)
    assert response(conn, 204)
    refute Repo.get(ItemList, item_list.id)
  end
end
