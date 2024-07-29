defmodule PoemRepoWeb.PoetController do
  use PoemRepoWeb, :controller

  alias PoemRepo.Poetry
  alias PoemRepo.Poetry.Poet

  def index(conn, _params) do
    poets = Poetry.list_poets()
    render(conn, :index, poets: poets)
  end

  def new(conn, _params) do
    changeset = Poetry.change_poet(%Poet{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"poet" => poet_params}) do
    case Poetry.create_poet(poet_params) do
      {:ok, poet} ->
        conn
        |> put_flash(:info, "Poet created successfully.")
        |> redirect(to: ~p"/poets/#{poet}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    poet = Poetry.get_poet!(id)
    render(conn, :show, poet: poet)
  end

  def edit(conn, %{"id" => id}) do
    poet = Poetry.get_poet!(id)
    changeset = Poetry.change_poet(poet)
    render(conn, :edit, poet: poet, changeset: changeset)
  end

  def update(conn, %{"id" => id, "poet" => poet_params}) do
    poet = Poetry.get_poet!(id)

    case Poetry.update_poet(poet, poet_params) do
      {:ok, poet} ->
        conn
        |> put_flash(:info, "Poet updated successfully.")
        |> redirect(to: ~p"/poets/#{poet}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, poet: poet, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    poet = Poetry.get_poet!(id)
    {:ok, _poet} = Poetry.delete_poet(poet)

    conn
    |> put_flash(:info, "Poet deleted successfully.")
    |> redirect(to: ~p"/poets")
  end
end
