defmodule NlwElixirPaydayWeb.UsersView do
  alias NlwElixirPayday.{User, Account}

  def render("create.json", %{user: %User{id: id, name: name, nickname: nickname, account: %Account{id: account_id, balance: balance}}}) do
    %{
      message: "Usuário criado",
      user: %{
        id: id,
        name: name,
        nickname: nickname,
        account: %{
          id: account_id,
          balance: balance
        }
      }
    }
  end

  def render("index.json", %{users: users}) do
    Enum.map(
      users,
      # fn %{id: id, name: name, nickname: nickname, account: %Account{id: account_id, balance: balance}} ->
      fn %{id: id, name: name, nickname: nickname} ->
        %{
          id: id,
          name: name,
          nickname: nickname,
          # account: %{
          #   id: account_id,
          #   balance: balance
          # }
        }
      end
    )
  end
end
