defmodule PoemRepo.Poetry.Poem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "poems" do
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(poem, attrs) do
    poem
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
