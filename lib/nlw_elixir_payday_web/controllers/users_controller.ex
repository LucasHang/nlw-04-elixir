defmodule NlwElixirPaydayWeb.UsersController do
  use NlwElixirPaydayWeb, :controller

  alias NlwElixirPayday.User

  def create(conn, params) do
    NlwElixirPayday.create_user(params)
    |> handle_response(conn)
  end

  defp handle_response({:ok, %User{} = user}, conn) do
    put_status(conn, :created)
    |> render("create.json", user: user)
  end
  defp handle_response({:error, result}, conn) do
    put_status(conn, :bad_request)
    |> put_view(NlwElixirPaydayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
