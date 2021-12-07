defmodule Readgithubapi.Repo do
  use Ecto.Repo,
    otp_app: :readgithubapi,
    adapter: Ecto.Adapters.Postgres
end
