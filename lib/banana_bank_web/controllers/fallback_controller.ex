defmodule BananaBankWeb.FallbackController do
  use BananaBankWeb, :controller

  # Função para tratar caso dê erro na nossa rota.
  def call(conn, {:error, changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: BananaBankWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end
