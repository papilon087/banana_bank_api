defmodule BananaBank.ViaCep.Client do
  use Tesla

  alias BananaBank.ViaCep.ClientBehaviour

  @default_url "https://viacep.com.br/ws"
  plug Tesla.Middleware.JSON

  @behaviour ClientBehaviour

  # Função para a criação da rota.
  @impl ClientBehaviour
  def call(url \\ @default_url, cep) do
    "#{url}/#{cep}/json"
    |> get()
    |> handle_response()
  end

  # Função para retornar sucesso.
  defp handle_response({:ok, %Tesla.Env{status: 200, body: %{erro: true}}}) do
    {:error, :not_found}
  end

  # Função para retornar erro na rota.
  defp handle_response({:ok, %Tesla.Env{status: 200, body: body}}) do
    {:ok, body}
  end

  # Função para retornar erro 400.
  defp handle_response({:ok, %Tesla.Env{status: 400}}) do
    {:error, :bad_request}
  end

  # Função para retornar erro gênericos.
  defp handle_response({:error, _}) do
    {:error, :internal_server_error}
  end
end
