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
end
