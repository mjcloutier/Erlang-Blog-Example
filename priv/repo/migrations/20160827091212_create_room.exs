defmodule Blog.Repo.Migrations.CreateRoom do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :name, :string
      add :created_by_username, :string
      add :created_by, :integer
      add :created_at, :datetime

      timestamps()
    end

  end
end
