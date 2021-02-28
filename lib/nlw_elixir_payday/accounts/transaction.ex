defmodule NlwElixirPayday.Accounts.Transaction do
  alias Ecto.Multi

  alias NlwElixirPayday.Repo
  alias NlwElixirPayday.Accounts.Operation
  alias NlwElixirPayday.Accounts.Transactions.Response, as: TransactionResponse

  def call(%{"from" => from_id, "to" => to_id, "value" => value}) do
    Multi.new()
    |> Multi.merge(fn _changes -> transaction_withdraw(from_id, value) end)
    |> Multi.merge(fn _changes -> transaction_deposit(to_id, value) end)
    |> run_transaction()
  end

  defp transaction_withdraw(id, value) do
    Operation.call(%{"id" => id, "value" => value}, :withdraw)
  end

  defp transaction_deposit(id, value) do
    Operation.call(%{"id" => id, "value" => value}, :deposit)
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{withdraw: from_account, deposit: to_account}} ->
        {:ok, TransactionResponse.build(from_account, to_account)}
    end
  end
end
