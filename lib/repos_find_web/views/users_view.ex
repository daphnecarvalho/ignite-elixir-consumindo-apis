defmodule ReposFindWeb.UsersView do
  use ReposFindWeb, :view

  alias ReposFind.User

  def render("create.json", %{token: token, user: %User{} = user}) do
    %{
      message: "User created!",
      token: token,
      user: user
    }
  end

  def render("sign_in.json", %{token: token}), do: %{token: token}

  def render("user.json", %{user: %User{} = user}), do: %{user: user}

  def render("index.json", %{users: users}), do: %{users: users}
end
