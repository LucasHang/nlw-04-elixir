defmodule NlwElixirPaydayWeb.AccountsController do
  use NlwElixirPaydayWeb, :controller

  alias NlwElixirPayday.Account

  action_fallback NlwElixirPaydayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- NlwElixirPayday.deposit(params) do
      put_status(conn, :ok)
      |> render("update.json", account: account)
    end
  end
end
