defmodule Blog.ItemListTest do
  use Blog.ModelCase

  alias Blog.ItemList

  @valid_attrs %{items: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ItemList.changeset(%ItemList{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ItemList.changeset(%ItemList{}, @invalid_attrs)
    refute changeset.valid?
  end
end
