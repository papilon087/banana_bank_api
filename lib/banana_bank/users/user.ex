defmodule BananaBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset

  # Variavél de módulo.
  @required_params [:name, :password, :email, :cep]

  # Espelho para nossa tabela
  schema "users" do
    field :name, :string
    # Campo Virtual
    field :password, :string, virtual: true
    field :password_hash, :string
    field :email, :string
    field :cep, :string

    timestamps()
  end

  # Função para mudanças no nosso banco.
  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 3)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:cep, is: 8)
    |> add_password_hash()
  end

  # Função privada para criptografia.
  defp add_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  # Função privada para erro, caso não dê match.
  defp add_password_hash(changeset), do: changeset
end
