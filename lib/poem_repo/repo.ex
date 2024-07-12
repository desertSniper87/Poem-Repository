defmodule PoemRepo.Repo do
  use Ecto.Repo,
    otp_app: :poem_repo,
    adapter: Ecto.Adapters.Postgres
end
