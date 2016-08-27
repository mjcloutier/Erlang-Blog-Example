defmodule Blog.ChatMessageTest do
  use Blog.ModelCase

  alias Blog.ChatMessage

  @valid_attrs %{created_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, message: "some content", room_id: 42, username: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ChatMessage.changeset(%ChatMessage{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ChatMessage.changeset(%ChatMessage{}, @invalid_attrs)
    refute changeset.valid?
  end
end
