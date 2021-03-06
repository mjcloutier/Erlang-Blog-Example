defmodule Blog.VideoTest do
  use Blog.ModelCase

  alias Blog.Video

  @valid_attrs %{created: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, description: "some content", filename: "some content", picture: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Video.changeset(%Video{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Video.changeset(%Video{}, @invalid_attrs)
    refute changeset.valid?
  end
end
