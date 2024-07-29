defmodule PoemRepoWeb.PoemController do
  use PoemRepoWeb, :controller

  alias PoemRepo.Poetry
  alias PoemRepo.Poetry.Poem

  def index(conn, _params) do
    poems = Poetry.list_poems()
    render(conn, :index, poems: poems)
  end

  def new(conn, _params) do
    changeset = Poetry.change_poem(%Poem{})
    poets = Poetry.list_poets()
    render(conn, :new, changeset: changeset, poets: poets)
  end

  def create(conn, %{"poem" => poem_params}) do
    case Poetry.create_poem(poem_params) do
      {:ok, poem} ->
        conn
        |> put_flash(:info, "Poem created successfully.")
        |> redirect(to: ~p"/poems/#{poem}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    poem = Poetry.get_poem!(id)
    render(conn, :show, poem: poem)
  end

  def edit(conn, %{"id" => id}) do
    poem = Poetry.get_poem!(id)
    changeset = Poetry.change_poem(poem)
    render(conn, :edit, poem: poem, changeset: changeset)
  end

  def update(conn, %{"id" => id, "poem" => poem_params}) do
    poem = Poetry.get_poem!(id)

    case Poetry.update_poem(poem, poem_params) do
      {:ok, poem} ->
        conn
        |> put_flash(:info, "Poem updated successfully.")
        |> redirect(to: ~p"/poems/#{poem}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, poem: poem, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    poem = Poetry.get_poem!(id)
    {:ok, _poem} = Poetry.delete_poem(poem)

    conn
    |> put_flash(:info, "Poem deleted successfully.")
    |> redirect(to: ~p"/poems")
  end
end
