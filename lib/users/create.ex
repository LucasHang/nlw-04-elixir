defmodule NlwElixirPayday.Users.Create do
  alias NlwElixirPayday.{Repo, User}

  def call(params) do
    User.changeset(params)
    |> Repo.insert()
  end
end
