defmodule Blog.PageController do
  use Blog.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def publish_item(conn, _params) do
    render conn, "publish_item.html"
  end
end
