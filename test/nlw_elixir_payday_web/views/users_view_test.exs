defmodule NlwElixirPaydayWeb.UsersViewTest do
  use NlwElixirPaydayWeb.ConnCase, async: true

  import Phoenix.View

  alias NlwElixirPayday.{User, Account}
  alias NlwElixirPaydayWeb.UsersView

  test "Renderiza create.json" do
    params = %{
      name: "Lucas",
      password: "123456",
      nickname: "Hang",
      email: "lucas@banana.com",
      age: 19
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} = NlwElixirPayday.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "Usuário criado",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        },
        id: user_id,
        name: "Lucas",
        nickname: "Hang"
      }
    }

    assert response == expected_response
  end
end
