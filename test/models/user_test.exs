defmodule Blog.UserTest do
  use Blog.ModelCase

  alias Blog.User

  @valid_attrs %{birth: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, created: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, email: "some content", encrypted_password: "some content", picture: "some content", username: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
