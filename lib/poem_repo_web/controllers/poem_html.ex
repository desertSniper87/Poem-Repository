defmodule PoemRepoWeb.PoemHTML do
  use PoemRepoWeb, :html

  embed_templates "poem_html/*"

  @doc """
  Renders a poem form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def poem_form(assigns)
end
