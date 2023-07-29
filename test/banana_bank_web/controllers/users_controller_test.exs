defmodule BananaBankWeb.UsersControllerTest do
  use BananaBankWeb.ConnCase

  describe "create/2" do
    test "successfully creates an user", %{conn: conn} do
      params = %{
        name: "João",
        cep: "12345678",
        email: "joao@frutas.com",
        password: "123456"
      }

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:created)

      assert %{
               "data" => %{"cep" => "12345678", "email" => "joao@frutas.com", "id" => _id, "name" => "João"},
               "message" => "User criado com sucesso"
             } = response
    end
  end
end
