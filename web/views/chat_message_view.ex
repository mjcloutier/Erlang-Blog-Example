defmodule Blog.ChatMessageView do
  use Blog.Web, :view

  def render("index.json", %{chat_messages: chat_messages}) do
    %{data: render_many(chat_messages, Blog.ChatMessageView, "chat_message.json")}
  end

  def render("show.json", %{chat_message: chat_message}) do
    %{data: render_one(chat_message, Blog.ChatMessageView, "chat_message.json")}
  end

  def render("chat_message.json", %{chat_message: chat_message}) do
    %{id: chat_message.id,
      room_id: chat_message.room_id,
      username: chat_message.username,
      message: chat_message.message,
      created_at: chat_message.created_at}
  end
end
