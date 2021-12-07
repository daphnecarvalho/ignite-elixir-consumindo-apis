defmodule ReposFindWeb.FallbackController do
  use ReposFindWeb, :controller

  alias ReposFind.Error
  alias ReposFindWeb.ErrorView

  def call(connection, {:error, %Error{status: status, result: result}}) do
    connection
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
