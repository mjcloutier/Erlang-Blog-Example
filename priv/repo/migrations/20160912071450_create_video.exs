defmodule Blog.Repo.Migrations.CreateVideo do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :title, :string
      add :description, :string
      add :picture, :string
      add :filename, :string
      add :created, :datetime

      timestamps()
    end

  end
end
