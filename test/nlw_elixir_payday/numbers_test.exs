defmodule NlwElixirPayday.NumbersTest do
  use ExUnit.Case, async: true

  alias NlwElixirPayday.Numbers

  describe "sum_from_file/1" do
    test "Quando existe um arquivo com o nome passado e uma lista de numeros no conteudo, retorna a soma total deles" do
      response = Numbers.sum_from_file("numbers.csv")

      expected = {:ok, %{result: 37}}

      assert response == expected
    end

    test "Quando não existe um arquivo com o nome passado, retorna um erro" do
      response = Numbers.sum_from_file("banana.csv")

      expected = {:error, "Arquivo inválido"}

      assert response == expected
    end
  end
end
