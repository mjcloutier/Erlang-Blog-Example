defmodule Blog.PostTest do
  use Blog.ModelCase

  alias Blog.Post

  @valid_attrs %{body: "some content", createdAt: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, description: "some content", picture: "some content", slug: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Post.changeset(%Post{}, @invalid_attrs)
    refute changeset.valid?
  end
end
