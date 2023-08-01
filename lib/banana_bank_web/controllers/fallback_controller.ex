defmodule BananaBankWeb.FallbackController do
  use BananaBankWeb, :controller

  # Função para tratar o erro da rota GET
  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(json: BananaBankWeb.ErrorJSON)
    |> render(:error, status: :not_found)
  end

  # Função para tratar o erro dê um CEP invalido na rota CREATE.
  def call(conn, {:error, :bad_request}) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: BananaBankWeb.ErrorJSON)
    |> render(:error, status: :bad_request)
  end

  # Função para tratar erro da rota Create.
  def call(conn, {:error, changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: BananaBankWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end
