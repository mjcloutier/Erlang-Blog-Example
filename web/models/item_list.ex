defmodule Blog.ItemList do
  use Blog.Web, :model

  schema "item_lists" do
    field :name, :string
    field :items, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :items])
    |> validate_required([:name, :items])
  end
end
