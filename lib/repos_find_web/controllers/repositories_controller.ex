defmodule ReposFindWeb.RepositoriesController do
  use ReposFindWeb, :controller

  alias ReposFindWeb.FallbackController

  action_fallback FallbackController

  def show(connection, %{"username" => username}) do
    with {:ok, [_ | _] = repositories} <- ReposFind.get_all_repositories(username) do
      connection
      |> put_status(:ok)
      |> render("show.json", repositories: repositories)
    end
  end
end
