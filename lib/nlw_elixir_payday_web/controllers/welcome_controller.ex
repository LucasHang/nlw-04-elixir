defmodule NlwElixirPaydayWeb.WelcomeController do
  use NlwElixirPaydayWeb, :controller

  alias NlwElixirPayday.Numbers

  def index(conn, %{"filename" => filename}) do
    String.split(filename, ".")
    |> (fn item -> if Enum.at(item, 1, nil), do: filename, else: "#{Enum.at(item, 0)}.csv" end).()
    |> Numbers.sum_from_file()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %{result: result}}, conn) do
    put_status(conn, :ok)
    |> json(%{message: "Bem vindo ao Nlw Elixir PayDay. Cá esta seu resultado: #{result}"})
  end
  defp handle_response({:error, reason}, conn) do
    put_status(conn, :bad_request)
    |> json(%{message: "Algo de errado aconteceu: #{reason}"})
  end
end
