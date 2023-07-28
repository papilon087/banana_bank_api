defmodule BananaBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset

  # Variavél de módulo.
  @required_params_create [:name, :password, :email, :cep]
  @required_params_update [:name, :email, :cep]

  # Espelho para nossa tabela.
  schema "users" do
    field :name, :string
    field :password, :string, virtual: true # Campo Virtual
    field :password_hash, :string
    field :email, :string
    field :cep, :string

    timestamps()
  end

  # Função para mudanças no nosso banco no create.
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params_create)
    |> do_validations(@required_params_create)
    |> add_password_hash()
  end

  # Função para mudanças no nosso banco no update.
  def changeset(user, params) do
    user
    |> cast(params, @required_params_create)
    |> validate_required(@required_params_update)
    |> add_password_hash()
  end

  # Função para validar as infomações dos campos preencidos.
  defp do_validations(changeset, fields) do
    changeset
    |> validate_required(fields)
    |> validate_length(:name, min: 3)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:cep, is: 8)
  end

  # Função privada para criptografia.
  defp add_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  # Função privada para erro, caso não dê match.
  defp add_password_hash(changeset), do: changeset
end
