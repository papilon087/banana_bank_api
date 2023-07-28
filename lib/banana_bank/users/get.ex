defmodule BananaBank.Users.Get do
  alias BananaBank.Users.User
  alias BananaBank.Repo

  # Função para monitorar e ver se existe um usuário.
  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
