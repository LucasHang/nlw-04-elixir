defmodule NlwElixirPaydayWeb.AccountsView do
  alias NlwElixirPayday.Account

  def render("update.json", %{account: %Account{id: id, balance: balance}}) do
    %{
      message: "Saldo atualizado com sucesso!",
      account: %{
        id: id,
        balance: balance
      }
    }
  end
end
