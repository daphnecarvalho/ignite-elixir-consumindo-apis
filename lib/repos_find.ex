defmodule ReposFind do
  alias ReposFind.Repositories.Get, as: RepositoryGet

  defdelegate get_all_repositories(params), to: RepositoryGet, as: :call
end
