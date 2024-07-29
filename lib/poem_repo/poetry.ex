defmodule PoemRepo.Poetry do
  @moduledoc """
  The Poetry context.
  """

  import Ecto.Query, warn: false
  alias PoemRepo.Repo

  alias PoemRepo.Poetry.Poem

  @doc """
  Returns the list of poems.

  ## Examples

      iex> list_poems()
      [%Poem{}, ...]

  """
  def list_poems do
    Repo.all(Poem)
  end

  @doc """
  Gets a single poem.

  Raises `Ecto.NoResultsError` if the Poem does not exist.

  ## Examples

      iex> get_poem!(123)
      %Poem{}

      iex> get_poem!(456)
      ** (Ecto.NoResultsError)

  """
  def get_poem!(id), do: Repo.get!(Poem, id)

  @doc """
  Creates a poem.

  ## Examples

      iex> create_poem(%{field: value})
      {:ok, %Poem{}}

      iex> create_poem(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_poem(attrs \\ %{}) do
    %Poem{}
    |> Poem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a poem.

  ## Examples

      iex> update_poem(poem, %{field: new_value})
      {:ok, %Poem{}}

      iex> update_poem(poem, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_poem(%Poem{} = poem, attrs) do
    poem
    |> Poem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a poem.

  ## Examples

      iex> delete_poem(poem)
      {:ok, %Poem{}}

      iex> delete_poem(poem)
      {:error, %Ecto.Changeset{}}

  """
  def delete_poem(%Poem{} = poem) do
    Repo.delete(poem)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking poem changes.

  ## Examples

      iex> change_poem(poem)
      %Ecto.Changeset{data: %Poem{}}

  """
  def change_poem(%Poem{} = poem, attrs \\ %{}) do
    Poem.changeset(poem, attrs)
  end

  alias PoemRepo.Poetry.Poet

  @doc """
  Returns the list of poets.

  ## Examples

      iex> list_poets()
      [%Poet{}, ...]

  """
  def list_poets do
    Repo.all(Poet)
  end

  def list_poets_enum do
    Repo.all(
      from p in Poet,
        # TODO: FIX
        select: {p.id, p.name}
    )
  end

  @doc """
  Gets a single poet.

  Raises `Ecto.NoResultsError` if the Poet does not exist.

  ## Examples

      iex> get_poet!(123)
      %Poet{}

      iex> get_poet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_poet!(id), do: Repo.get!(Poet, id)

  @doc """
  Creates a poet.

  ## Examples

      iex> create_poet(%{field: value})
      {:ok, %Poet{}}

      iex> create_poet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_poet(attrs \\ %{}) do
    %Poet{}
    |> Poet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a poet.

  ## Examples

      iex> update_poet(poet, %{field: new_value})
      {:ok, %Poet{}}

      iex> update_poet(poet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_poet(%Poet{} = poet, attrs) do
    poet
    |> Poet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a poet.

  ## Examples

      iex> delete_poet(poet)
      {:ok, %Poet{}}

      iex> delete_poet(poet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_poet(%Poet{} = poet) do
    Repo.delete(poet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking poet changes.

  ## Examples

      iex> change_poet(poet)
      %Ecto.Changeset{data: %Poet{}}

  """
  def change_poet(%Poet{} = poet, attrs \\ %{}) do
    Poet.changeset(poet, attrs)
  end

  def list_poems_by_poet(poet_id) do
    Poem
    |> where(poet_id: ^poet_id)
    |> Repo.all()
  end

  def get_poem_with_poet!(id) do
    Poem
    |> Repo.get!(id)
    |> Repo.preload(:poet)
  end
end
