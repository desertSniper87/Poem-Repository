defmodule PoemRepo.Poetry.Poem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "poems" do
    field :title, :string
    field :content, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(poem, attrs) do
    poem
    |> cast(attrs, [:title, :content])
    |> validate_required([:title, :content])
  end
end
