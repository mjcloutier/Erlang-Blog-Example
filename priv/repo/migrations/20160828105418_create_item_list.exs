defmodule Blog.Repo.Migrations.CreateItemList do
  use Ecto.Migration

  def change do
    create table(:item_lists) do
      add :name, :string
      # add :items, :string
      # use json instead
      add :items, :map

      timestamps()
    end

  end
end
