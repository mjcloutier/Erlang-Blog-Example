defmodule Blog.ChatMeMessage do
  use Blog.Web, :model

  schema "chat_messages" do
    field :username, :string
    field :message, :string
    field :created_at, Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :message, :created_at])
    |> validate_required([:username, :message, :created_at])
  end
end
