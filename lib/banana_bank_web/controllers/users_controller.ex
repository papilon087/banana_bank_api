defmodule BananaBankWeb.UsersController do
  use BananaBankWeb, :controller

  alias BananaBank.Users
  alias Users.User

  action_fallback BananaBankWeb.FallbackController

  # Função para criar rota de usuário.
  def create(conn, params) do
    with {:ok, %User{} = user} <- Users.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end

  # Função para criar rota de usuário.
  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Users.get(id) do
      conn
      |> put_status(:ok)
      |> render(:get, user: user)
    end
  end
end
