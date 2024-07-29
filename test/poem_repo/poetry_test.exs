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

  describe "poems" do
    alias PoemRepo.Poetry.Poem

    import PoemRepo.PoetryFixtures

    @invalid_attrs %{title: nil, content: nil}

    test "list_poems/0 returns all poems" do
      poem = poem_fixture()
      assert Poetry.list_poems() == [poem]
    end

    test "get_poem!/1 returns the poem with given id" do
      poem = poem_fixture()
      assert Poetry.get_poem!(poem.id) == poem
    end

    test "create_poem/1 with valid data creates a poem" do
      valid_attrs = %{title: "some title", content: "some content"}

      assert {:ok, %Poem{} = poem} = Poetry.create_poem(valid_attrs)
      assert poem.title == "some title"
      assert poem.content == "some content"
    end

    test "create_poem/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Poetry.create_poem(@invalid_attrs)
    end

    test "update_poem/2 with valid data updates the poem" do
      poem = poem_fixture()
      update_attrs = %{title: "some updated title", content: "some updated content"}

      assert {:ok, %Poem{} = poem} = Poetry.update_poem(poem, update_attrs)
      assert poem.title == "some updated title"
      assert poem.content == "some updated content"
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

  describe "poets" do
    alias PoemRepo.Poetry.Poet

    import PoemRepo.PoetryFixtures

    @invalid_attrs %{name: nil, bio: nil, birth_date: nil, death_date: nil}

    test "list_poets/0 returns all poets" do
      poet = poet_fixture()
      assert Poetry.list_poets() == [poet]
    end

    test "get_poet!/1 returns the poet with given id" do
      poet = poet_fixture()
      assert Poetry.get_poet!(poet.id) == poet
    end

    test "create_poet/1 with valid data creates a poet" do
      valid_attrs = %{name: "some name", bio: "some bio", birth_date: ~D[2024-07-28], death_date: ~D[2024-07-28]}

      assert {:ok, %Poet{} = poet} = Poetry.create_poet(valid_attrs)
      assert poet.name == "some name"
      assert poet.bio == "some bio"
      assert poet.birth_date == ~D[2024-07-28]
      assert poet.death_date == ~D[2024-07-28]
    end

    test "create_poet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Poetry.create_poet(@invalid_attrs)
    end

    test "update_poet/2 with valid data updates the poet" do
      poet = poet_fixture()
      update_attrs = %{name: "some updated name", bio: "some updated bio", birth_date: ~D[2024-07-29], death_date: ~D[2024-07-29]}

      assert {:ok, %Poet{} = poet} = Poetry.update_poet(poet, update_attrs)
      assert poet.name == "some updated name"
      assert poet.bio == "some updated bio"
      assert poet.birth_date == ~D[2024-07-29]
      assert poet.death_date == ~D[2024-07-29]
    end

    test "update_poet/2 with invalid data returns error changeset" do
      poet = poet_fixture()
      assert {:error, %Ecto.Changeset{}} = Poetry.update_poet(poet, @invalid_attrs)
      assert poet == Poetry.get_poet!(poet.id)
    end

    test "delete_poet/1 deletes the poet" do
      poet = poet_fixture()
      assert {:ok, %Poet{}} = Poetry.delete_poet(poet)
      assert_raise Ecto.NoResultsError, fn -> Poetry.get_poet!(poet.id) end
    end

    test "change_poet/1 returns a poet changeset" do
      poet = poet_fixture()
      assert %Ecto.Changeset{} = Poetry.change_poet(poet)
    end
  end
end
