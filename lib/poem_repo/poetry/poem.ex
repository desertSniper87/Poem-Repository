defmodule PoemRepo.Poetry.Poem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "poems" do
    field :title, :string
    field :content, :string
    belongs_to :poet, PoemRepo.Poetry.Poet

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(poem, attrs) do
    poem
    |> cast(attrs, [:title, :content, :poet_id])
    |> validate_required([:title, :content, :poet_id])
  end
end
