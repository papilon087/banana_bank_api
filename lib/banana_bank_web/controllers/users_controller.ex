defmodule BananaBankWeb.UsersController do
  use BananaBankWeb, :controller

  alias BananaBank.Users.Create

  # Função para criar rota de usuário.
  def create(conn, params) do
    params
    |> Create.call()
    |> handle_response(conn)
  end

  # Função para renderizar nossa reposta caso dê tudo certo.
  defp handle_response({:ok, user}, conn) do
    conn
    |> put_status(:created)
    |> render("user.json", user: user)
  end

  # Função para tratar caso dê erro na nossa rota.
  defp handle_response({:error, _changeset} = error, conn) do
    conn
    |> put_status(:bad_request)
    |> render("error.json", error: error)
  end
end
