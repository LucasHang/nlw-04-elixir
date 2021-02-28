defmodule NlwElixirPayday.Accounts.Index do
  alias NlwElixirPayday.{Repo, Account}

  def call() do
    Repo.all(Account)
  end
end
