defmodule ReposFindWeb.RepositoriesView do
  use ReposFindWeb, :view

  def render("show.json", %{repositories: repositories}), do: %{repositories: repositories}
end
