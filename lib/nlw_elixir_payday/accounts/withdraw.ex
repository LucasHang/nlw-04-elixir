defmodule NlwElixirPayday.Accounts.Withdraw do
  alias NlwElixirPayday.Repo
  alias NlwElixirPayday.Accounts.Operation

  def call(params) do
    Operation.call(params, :withdraw)
    |> run_transaction()
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{withdraw: account}} -> {:ok, account}
    end
  end
end
