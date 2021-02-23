defmodule NlwElixirPayday.Repo do
  use Ecto.Repo,
    otp_app: :nlw_elixir_payday,
    adapter: Ecto.Adapters.Postgres
end
