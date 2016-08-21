defmodule Blog.Post do
  use Blog.Web, :model

  schema "posts" do
    field :slug, :string
    field :title, :string
    field :description, :string
    field :picture, :string
    field :body, :string
    field :createdAt, Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:slug, :title, :description, :picture, :body, :createdAt])
    |> validate_required([:slug, :title, :description, :picture, :body, :createdAt])
  end
end
