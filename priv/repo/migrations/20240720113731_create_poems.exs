defmodule PoemRepo.Repo.Migrations.CreatePoems do
  use Ecto.Migration

  def change do
    create table(:poems) do
      add :title, :string

      timestamps(type: :utc_datetime)
    end
  end
end
