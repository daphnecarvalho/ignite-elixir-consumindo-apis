defmodule ReposFindWeb.UsersController do
  use ReposFindWeb, :controller

  alias ReposFind.User
  alias ReposFindWeb.Auth.Guardian
  alias ReposFindWeb.FallbackController

  action_fallback FallbackController

  # params = %{name: "ABCDF123", password: "123456", username: "abcdf123"}
  # {:ok, %ReposFind.User{} = user} = ReposFind.create_user(params)
  # ReposFindWeb.Auth.Guardian.encode_and_sign(user)
  def create(connection, params) do
    with {:ok, %User{} = user} <- ReposFind.create_user(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      connection
      |> put_status(:created)
      |> render("create.json", token: token, user: user)
    end
  end

  def delete(connection, %{"id" => id}) do
    with {:ok, %User{}} <- ReposFind.delete_user(id) do
      connection
      |> put_status(:no_content)
      |> text("")
    end
  end

  def index(connection, %{"username" => username}) do
    with {:ok, %User{} = user} <- ReposFind.get_user_by_username(username) do
      connection
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def index(connection, _params) do
    with {:ok, users} <- ReposFind.get_all_users() do
      connection
      |> put_status(:ok)
      |> render("index.json", users: users)
    end
  end

  def show(connection, %{"id" => id}) do
    with {:ok, %User{} = user} <- ReposFind.get_user_by_id(id) do
      connection
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def sign_in(connection, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      connection
      |> put_status(:ok)
      |> render("sign_in.json", token: token)
    end
  end

  def update(connection, params) do
    with {:ok, %User{} = user} <- ReposFind.update_user(params) do
      connection
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end
end
