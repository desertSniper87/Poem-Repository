defmodule PoemRepo.Repo.Migrations.CreatePoets do
  use Ecto.Migration

  def change do
    create table(:poets) do
      add :name, :string
      add :bio, :text
      add :birth_date, :date
      add :death_date, :date

      timestamps(type: :utc_datetime)
    end
  end
end
