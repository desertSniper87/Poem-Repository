defmodule PoemRepo.Poetry.Poet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "poets" do
    field :name, :string
    field :bio, :string
    field :birth_date, :date
    field :death_date, :date
    has_many :poems, PoemRepo.Poetry.Poem

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(poet, attrs) do
    poet
    |> cast(attrs, [:name, :bio, :birth_date, :death_date])
    |> validate_required([:name, :birth_date])
  end
end
