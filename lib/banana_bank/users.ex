defmodule BananaBank.Users do
  alias BananaBank.Users.Create
  alias BananaBank.Users.Get

  # Função para delegar uma chamada madulo/função.
  defdelegate create(params), to: Create, as: :call
  # Função para delegar uma chamada madulo/função GET.
  defdelegate get(id), to: Get, as: :call
end
