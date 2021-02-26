defmodule NlwElixirPaydayWeb.UsersController do
  use NlwElixirPaydayWeb, :controller

  alias NlwElixirPayday.User

  action_fallback NlwElixirPaydayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- NlwElixirPayday.create_user(params) do
      put_status(conn, :created)
      |> render("create.json", user: user)
    end
  end

  def index(conn, _params) do
    with users <- NlwElixirPayday.index_user() do
      put_status(conn, :ok)
      |> render("index.json", users: users)
    end
  end
end
