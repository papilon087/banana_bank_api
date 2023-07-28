defmodule BananaBankWeb.UsersJSON do
  alias BananaBank.Users.User

  # Função para renderizar a dados do usuário
  def create(%{user: user}) do
    %{
      message: "User criado com sucesso",
      data: data(user)
    }
  end

  # Função para retornar nossa view do get.
  def get(%{user: user}), do: %{ data: data(user)}

  # Função para retornar nosso data formatado.
  defp data(%User{} = user) do
    %{
      id: user.id,
      cep: user.cep,
      email: user.email,
      name: user.name
    }
  end
end
