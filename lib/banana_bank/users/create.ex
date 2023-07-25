defmodule BananaBank.Users.Create do
  alias BananaBank.Users.User
  alias BananaBank.Repo

  # Função para criar um usuário.
  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
