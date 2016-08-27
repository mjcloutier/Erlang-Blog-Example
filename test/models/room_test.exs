defmodule Blog.RoomTest do
  use Blog.ModelCase

  alias Blog.Room

  @valid_attrs %{created_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, created_by: 42, created_by_username: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Room.changeset(%Room{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Room.changeset(%Room{}, @invalid_attrs)
    refute changeset.valid?
  end
end
