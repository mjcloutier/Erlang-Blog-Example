defmodule Blog.User do
  use Blog.Web, :model

  schema "users" do
    field :username, :string
    field :email, :string
    field :encrypted_password, :string
    field :picture, :string
    field :birth, Ecto.DateTime
    field :created, Ecto.DateTime, default: Ecto.DateTime.utc

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :email, :encrypted_password, :picture, :birth, :created])
    |> validate_required([:username, :email, :created])
  end
end
