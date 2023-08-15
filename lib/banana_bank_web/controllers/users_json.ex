defmodule BananaBankWeb.UsersJSON do
  alias BananaBank.Users.User

  # Função para renderizar a dados do usuário
  def create(%{user: user}) do
    %{
      message: "User criado com sucesso",
      data: data(user)
    }
  end

  def login(%{token: token}) do
    %{
      message: "Usuário autenticado com sucesso!",
      Bearer: token
    }
  end

  def delete(%{user: user}), do: %{data: data(user)}
  def get(%{user: user}), do: %{data: user}
  def update(%{user: user}), do: %{message: "User atualizado com sucesso!", data: data(user)}

  defp data(%User{} = user) do
    %{
      message: "Usuário criado com sucesso.",
      id: user.id,
      cep: user.cep,
      email: user.email,
      name: user.name
    }
  end
end
