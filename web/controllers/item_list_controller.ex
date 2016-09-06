defmodule Blog.ItemListController do
  use Blog.Web, :controller

  alias Blog.ItemList

  def index(conn, _params) do
    item_lists = Repo.all(ItemList)
    render(conn, "index.json", item_lists: item_lists)
  end

  def create(conn, %{"item_list" => item_list_params}) do
    changeset = ItemList.changeset(%ItemList{}, item_list_params)

    case Repo.insert(changeset) do
      {:ok, item_list} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", item_list_path(conn, :show, item_list))
        |> render("show.json", item_list: item_list)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Blog.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    item_list = Repo.get!(ItemList, id)
    render(conn, "show.json", item_list: item_list)
  end

  def update(conn, %{"id" => id, "item_list" => item_list_params}) do
    item_list = Repo.get!(ItemList, id)
    changeset = ItemList.changeset(item_list, item_list_params)

    case Repo.update(changeset) do
      {:ok, item_list} ->
        render(conn, "show.json", item_list: item_list)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Blog.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    item_list = Repo.get!(ItemList, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(item_list)

    send_resp(conn, :no_content, "")
  end
end
