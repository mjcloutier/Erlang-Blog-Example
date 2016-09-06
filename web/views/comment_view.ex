defmodule Blog.CommentView do
  use Blog.Web, :view

  def render("index.json", %{comments: comments}) do
    %{data: render_many(comments, Blog.CommentView, "comment.json")}
  end

  def render("show.json", %{comment: comment}) do
    %{data: render_one(comment, Blog.CommentView, "comment.json")}
  end

  def render("comment.json", %{comment: comment}) do
    %{id: comment.id,
      post_id: comment.post_id,
      username: comment.username,
      body: comment.body,
      created: comment.created}
  end
end
