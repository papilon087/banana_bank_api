defmodule BananaBankWeb.WelcomeController do
  use BananaBankWeb, :controller

  # Função para criar a primeira rota da aplicação.
  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Bem vindo ao BananaBank", status: :ok})
  end
end
