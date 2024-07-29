defmodule PoemRepoWeb.PoetHTML do
  use PoemRepoWeb, :html

  embed_templates "poet_html/*"

  @doc """
  Renders a poet form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def poet_form(assigns)
end
