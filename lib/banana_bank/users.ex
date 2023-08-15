defmodule BananaBank.Users do
  alias BananaBank.Users.Create
  alias BananaBank.Users.Delete
  alias BananaBank.Users.Get
  alias BananaBank.Users.Update
  alias BananaBank.Users.Verify

  # Função para delegar uma chamada modulo/função create.
  defdelegate create(params), to: Create, as: :call

  # Função para delegar uma chamada modulo/função delete.
  defdelegate delete(id), to: Delete, as: :call

  # Função para delegar uma chamada modulo/função GET.
  defdelegate get(id), to: Get, as: :call

  # Função para delegar uma chamada modulo/função Update.
  defdelegate update(params), to: Update, as: :call

  # Função para delegar uma chamada na verificação
  defdelegate login(params), to: Verify, as: :call
end
