defmodule Blog.Video do
  use Blog.Web, :model

  schema "videos" do
    field :title, :string
    field :description, :string
    field :picture, :string
    field :filename, :string
    field :created, Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :picture, :filename, :created])
    |> validate_required([:title, :description, :picture, :filename, :created])
  end
end
