defmodule Blog.ItemListView do
  use Blog.Web, :view

  def render("index.json", %{item_lists: item_lists}) do
    %{data: render_many(item_lists, Blog.ItemListView, "item_list.json")}
  end

  def render("show.json", %{item_list: item_list}) do
    %{data: render_one(item_list, Blog.ItemListView, "item_list.json")}
  end

  def render("item_list.json", %{item_list: item_list}) do
    %{id: item_list.id,
      name: item_list.name,
      items: item_list.items}
  end
end
