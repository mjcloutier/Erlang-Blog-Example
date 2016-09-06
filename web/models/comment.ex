defmodule Blog.Comment do
  use Blog.Web, :model

  schema "comments" do
    field :post_id, :integer
    field :username, :string
    field :body, :string
    field :created, Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:post_id, :username, :body, :created])
    |> validate_required([:post_id, :username, :body, :created])
  end
end
