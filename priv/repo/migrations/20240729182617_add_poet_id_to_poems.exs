defmodule PoemRepo.Repo.Migrations.AddPoetIdToPoems do
  use Ecto.Migration

  def change do
    alter table(:poems) do
      add :poet_id, references(:poets, on_delete: :nothing)
    end

    create index(:poems, [:poet_id])
  end
end
