defmodule NlwElixirPaydayWeb.AccountsControllerTest do
  use NlwElixirPaydayWeb.ConnCase, async: true

  alias NlwElixirPayday.{User, Account}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Lucas",
        password: "123456",
        nickname: "Hang",
        email: "lucas@banana.com",
        age: 19
      }

      {:ok, %User{account: %Account{id: account_id}}} = NlwElixirPayday.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic YmFuYW5hOm5hbmljYTEyMw==")

      {:ok , conn: conn, account_id: account_id}
    end

    test "Quando todos parâmetros são válidos, faz o depósito", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        post(conn, Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{
        "account" => %{"balance" => "50.00", "id" => _id},
        "message" => "Saldo atualizado com sucesso!"
      } = response
    end

    test "Quando os parâmetros são inválidos, retorna erro", %{conn: conn, account_id: account_id} do
      params = %{"value" => "banana"}

      response =
        post(conn, Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid deposit value!"}

      assert response == expected_response
    end
  end
end
