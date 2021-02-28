defmodule NlwElixirPayday.Users.CreateTest do
  use NlwElixirPayday.DataCase, async: true

  alias NlwElixirPayday.User
  alias NlwElixirPayday.Users.Create

  describe "call/1" do
    test "Quando todos parâmetros são válidos, retorna um usuário" do
      params = %{
        name: "Lucas",
        password: "123456",
        nickname: "Hang",
        email: "lucas@banana.com",
        age: 19
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Lucas", age: 19, id: ^user_id} = user
    end

    test "Quando os parâmetros não são válidos, retorna um erro" do
      params = %{
        name: "Lucas",
        nickname: "Hang",
        email: "lucas@banana.com",
        age: 14
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
