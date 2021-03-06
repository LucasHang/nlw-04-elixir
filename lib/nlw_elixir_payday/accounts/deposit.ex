defmodule NlwElixirPayday.Accounts.Deposit do
  alias NlwElixirPayday.Repo
  alias NlwElixirPayday.Accounts.Operation

  def call(params) do
    Operation.call(params, :deposit)
    |> run_transaction()
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{deposit: account}} -> {:ok, account}
    end
  end
end
