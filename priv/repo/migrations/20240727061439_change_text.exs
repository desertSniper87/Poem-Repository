defmodule PoemRepo.Repo.Migrations.ChangeText do
  use Ecto.Migration

  def change do
    alter table(:poems) do
      modify :content, :text
    end
  end
end
