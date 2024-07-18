defmodule PoemRepoWeb.PageController do
  use PoemRepoWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end

  def index(conn, _params) do
    render(conn, :index, layout: false)
  end
end
