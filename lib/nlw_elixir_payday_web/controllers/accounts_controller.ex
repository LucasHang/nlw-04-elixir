defmodule NlwElixirPaydayWeb.AccountsController do
  use NlwElixirPaydayWeb, :controller

  alias NlwElixirPayday.Account
  alias NlwElixirPayday.Accounts.Transactions.Response, as: TransactionResponse

  action_fallback NlwElixirPaydayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- NlwElixirPayday.deposit(params) do
      put_status(conn, :ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- NlwElixirPayday.withdraw(params) do
      put_status(conn, :ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- NlwElixirPayday.transaction(params) do
      put_status(conn, :ok)
      |> render("transaction.json", transaction: transaction)
    end
  end

  def index(conn, _params) do
    with accounts <- NlwElixirPayday.index_account() do
      put_status(conn, :ok)
      |> render("index.json", accounts: accounts)
    end
  end
end
