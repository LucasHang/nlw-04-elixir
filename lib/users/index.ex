defmodule NlwElixirPayday.Users.Index do
  alias NlwElixirPayday.{Repo, User}

  def call() do
    Repo.all(User)
    |> Repo.preload(:account)
  end
end
