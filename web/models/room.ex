defmodule Blog.Room do
  use Blog.Web, :model

  schema "rooms" do
    field :name, :string
    field :created_by_username, :string
    field :created_by, :integer
    field :created_at, Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :created_by_username, :created_by, :created_at])
    |> validate_required([:name, :created_by_username, :created_by, :created_at])
  end
end
