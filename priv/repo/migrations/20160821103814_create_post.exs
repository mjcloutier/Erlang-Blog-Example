defmodule Blog.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :slug, :string
      add :title, :string
      add :description, :string
      add :picture, :string
      add :body, :text
      add :createdAt, :datetime

      timestamps()
    end

  end
end
