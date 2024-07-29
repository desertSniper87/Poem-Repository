defmodule PoemRepo.PoetryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PoemRepo.Poetry` context.
  """

  @doc """
  Generate a poem.
  """
  def poem_fixture(attrs \\ %{}) do
    {:ok, poem} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> PoemRepo.Poetry.create_poem()

    poem
  end

  @doc """
  Generate a poem.
  """
  def poem_fixture(attrs \\ %{}) do
    {:ok, poem} =
      attrs
      |> Enum.into(%{
        content: "some content",
        title: "some title"
      })
      |> PoemRepo.Poetry.create_poem()

    poem
  end

  @doc """
  Generate a poet.
  """
  def poet_fixture(attrs \\ %{}) do
    {:ok, poet} =
      attrs
      |> Enum.into(%{
        bio: "some bio",
        birth_date: ~D[2024-07-28],
        death_date: ~D[2024-07-28],
        name: "some name"
      })
      |> PoemRepo.Poetry.create_poet()

    poet
  end
end
