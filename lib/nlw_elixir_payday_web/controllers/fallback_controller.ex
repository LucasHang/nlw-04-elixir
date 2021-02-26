defmodule NlwElixirPaydayWeb.FallbackController do
  use NlwElixirPaydayWeb, :controller

  def call(conn, {:error, result}) do
    put_status(conn, :bad_request)
    |> put_view(NlwElixirPaydayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
