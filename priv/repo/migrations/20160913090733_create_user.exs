defmodule Blog.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :encrypted_password, :string
      add :picture, :string
      add :birth, :datetime
      add :created, :datetime

      timestamps()
    end

  end
end
