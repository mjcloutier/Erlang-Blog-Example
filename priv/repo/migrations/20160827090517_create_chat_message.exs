defmodule Blog.Repo.Migrations.CreateChatMessage do
  use Ecto.Migration

  def change do
    create table(:chat_messages) do
      add :room_id, :integer
      add :username, :string
      add :message, :text
      add :created_at, :datetime

      timestamps()
    end

  end
end
