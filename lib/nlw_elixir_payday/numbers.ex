defmodule NlwElixirPayday.Numbers do
  def sum_from_file(filename) do
    File.read(filename)
    |> handle_file()
  end

  defp handle_file({:ok, result}) do
    result =
      String.split(result, ",")
      |> Stream.map(fn item -> String.to_integer(item) end)
      |> Enum.sum()

    {:ok, %{result: result}}
  end
  defp handle_file({:error, _reason}), do: {:error, "Arquivo inválido"}
end
