defmodule Words.Repo do
  use Ecto.Repo,
    otp_app: :words,
    adapter: Ecto.Adapters.Postgres
end
