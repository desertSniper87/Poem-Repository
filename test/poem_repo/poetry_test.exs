defmodule PoemRepo.PoetryTest do
  use PoemRepo.DataCase

  alias PoemRepo.Poetry

  describe "poems" do
    alias PoemRepo.Poetry.Poem

    import PoemRepo.PoetryFixtures

    @invalid_attrs %{title: nil}

    test "list_poems/0 returns all poems" do
      poem = poem_fixture()
      assert Poetry.list_poems() == [poem]
    end

    test "get_poem!/1 returns the poem with given id" do
      poem = poem_fixture()
      assert Poetry.get_poem!(poem.id) == poem
    end

    test "create_poem/1 with valid data creates a poem" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Poem{} = poem} = Poetry.create_poem(valid_attrs)
      assert poem.title == "some title"
    end

    test "create_poem/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Poetry.create_poem(@invalid_attrs)
    end

    test "update_poem/2 with valid data updates the poem" do
      poem = poem_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Poem{} = poem} = Poetry.update_poem(poem, update_attrs)
      assert poem.title == "some updated title"
    end

    test "update_poem/2 with invalid data returns error changeset" do
      poem = poem_fixture()
      assert {:error, %Ecto.Changeset{}} = Poetry.update_poem(poem, @invalid_attrs)
      assert poem == Poetry.get_poem!(poem.id)
    end

    test "delete_poem/1 deletes the poem" do
      poem = poem_fixture()
      assert {:ok, %Poem{}} = Poetry.delete_poem(poem)
      assert_raise Ecto.NoResultsError, fn -> Poetry.get_poem!(poem.id) end
    end

    test "change_poem/1 returns a poem changeset" do
      poem = poem_fixture()
      assert %Ecto.Changeset{} = Poetry.change_poem(poem)
    end
  end
end
