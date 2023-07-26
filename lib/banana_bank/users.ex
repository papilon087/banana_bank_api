defmodule BananaBank.Users do
  alias BananaBank.Users.Create

  # Função para delegar uma chamada madulo/função.
  defdelegate create(params), to: Create, as: :call
end
