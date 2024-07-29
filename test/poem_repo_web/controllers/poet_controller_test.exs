defmodule PoemRepoWeb.PoetControllerTest do
  use PoemRepoWeb.ConnCase

  import PoemRepo.PoetryFixtures

  @create_attrs %{name: "some name", bio: "some bio", birth_date: ~D[2024-07-28], death_date: ~D[2024-07-28]}
  @update_attrs %{name: "some updated name", bio: "some updated bio", birth_date: ~D[2024-07-29], death_date: ~D[2024-07-29]}
  @invalid_attrs %{name: nil, bio: nil, birth_date: nil, death_date: nil}

  describe "index" do
    test "lists all poets", %{conn: conn} do
      conn = get(conn, ~p"/poets")
      assert html_response(conn, 200) =~ "Listing Poets"
    end
  end

  describe "new poet" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/poets/new")
      assert html_response(conn, 200) =~ "New Poet"
    end
  end

  describe "create poet" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/poets", poet: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/poets/#{id}"

      conn = get(conn, ~p"/poets/#{id}")
      assert html_response(conn, 200) =~ "Poet #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/poets", poet: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Poet"
    end
  end

  describe "edit poet" do
    setup [:create_poet]

    test "renders form for editing chosen poet", %{conn: conn, poet: poet} do
      conn = get(conn, ~p"/poets/#{poet}/edit")
      assert html_response(conn, 200) =~ "Edit Poet"
    end
  end

  describe "update poet" do
    setup [:create_poet]

    test "redirects when data is valid", %{conn: conn, poet: poet} do
      conn = put(conn, ~p"/poets/#{poet}", poet: @update_attrs)
      assert redirected_to(conn) == ~p"/poets/#{poet}"

      conn = get(conn, ~p"/poets/#{poet}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, poet: poet} do
      conn = put(conn, ~p"/poets/#{poet}", poet: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Poet"
    end
  end

  describe "delete poet" do
    setup [:create_poet]

    test "deletes chosen poet", %{conn: conn, poet: poet} do
      conn = delete(conn, ~p"/poets/#{poet}")
      assert redirected_to(conn) == ~p"/poets"

      assert_error_sent 404, fn ->
        get(conn, ~p"/poets/#{poet}")
      end
    end
  end

  defp create_poet(_) do
    poet = poet_fixture()
    %{poet: poet}
  end
end
