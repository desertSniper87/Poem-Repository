defmodule PoemRepoWeb.PoemControllerTest do
  use PoemRepoWeb.ConnCase

  import PoemRepo.PoetryFixtures

  @create_attrs %{title: "some title"}
  @update_attrs %{title: "some updated title"}
  @invalid_attrs %{title: nil}

  describe "index" do
    test "lists all poems", %{conn: conn} do
      conn = get(conn, ~p"/poems")
      assert html_response(conn, 200) =~ "Listing Poems"
    end
  end

  describe "new poem" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/poems/new")
      assert html_response(conn, 200) =~ "New Poem"
    end
  end

  describe "create poem" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/poems", poem: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/poems/#{id}"

      conn = get(conn, ~p"/poems/#{id}")
      assert html_response(conn, 200) =~ "Poem #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/poems", poem: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Poem"
    end
  end

  describe "edit poem" do
    setup [:create_poem]

    test "renders form for editing chosen poem", %{conn: conn, poem: poem} do
      conn = get(conn, ~p"/poems/#{poem}/edit")
      assert html_response(conn, 200) =~ "Edit Poem"
    end
  end

  describe "update poem" do
    setup [:create_poem]

    test "redirects when data is valid", %{conn: conn, poem: poem} do
      conn = put(conn, ~p"/poems/#{poem}", poem: @update_attrs)
      assert redirected_to(conn) == ~p"/poems/#{poem}"

      conn = get(conn, ~p"/poems/#{poem}")
      assert html_response(conn, 200) =~ "some updated title"
    end

    test "renders errors when data is invalid", %{conn: conn, poem: poem} do
      conn = put(conn, ~p"/poems/#{poem}", poem: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Poem"
    end
  end

  describe "delete poem" do
    setup [:create_poem]

    test "deletes chosen poem", %{conn: conn, poem: poem} do
      conn = delete(conn, ~p"/poems/#{poem}")
      assert redirected_to(conn) == ~p"/poems"

      assert_error_sent 404, fn ->
        get(conn, ~p"/poems/#{poem}")
      end
    end
  end

  defp create_poem(_) do
    poem = poem_fixture()
    %{poem: poem}
  end
end
