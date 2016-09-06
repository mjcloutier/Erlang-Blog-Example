defmodule Blog.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :post_id, :integer
      add :username, :string
      add :body, :text
      add :created, :datetime

      timestamps()
    end

  end
end
