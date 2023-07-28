defmodule BananaBank.Users.Update do
  alias BananaBank.Users.User
  alias BananaBank.Repo

  # Função para monitorar e ver se existe um usuário.
  def call(%{"id" => id} = params) do
    IO.inspect(params)

    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> update(user, params)
    end
  end

  # Função para encontar o usuário.
  defp update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
