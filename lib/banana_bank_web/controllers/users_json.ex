defmodule BananaBankWeb.UsersJSON do
  alias BananaBank.Users.User

  # Função para renderizar a criação do usuário
  def create(%{user: user}) do
    %{
      message: "User criado com sucesso",
      data: data(user)
    }
  end

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
