defmodule NlwElixirPaydayWeb.AccountsView do
  alias NlwElixirPayday.Account
  alias NlwElixirPayday.Accounts.Transactions.Response, as: TransactionResponse

  def render("update.json", %{account: %Account{id: id, balance: balance}}) do
    %{
      message: "Saldo atualizado com sucesso!",
      account: %{
        id: id,
        balance: balance
      }
    }
  end

  def render("transaction.json", %{transaction: %TransactionResponse{from_account: from_account, to_account: to_account}}) do
    %{
      message: "Transação realizada com sucesso!",
      transaction: %{
        from_account: %{
          id: from_account.id,
          balance: from_account.balance
        },
        to_account: %{
          id: to_account.id,
          balance: to_account.balance
        }
      }
    }
  end

  def render("index.json", %{accounts: accounts}) do
    Enum.map(
      accounts,
      fn %{id: id, balance: balance} ->
        %{
          id: id,
          balance: balance
        }
      end
    )
  end
end
