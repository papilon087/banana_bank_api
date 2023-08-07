defmodule BananaBank.ViaCep.ClientTest do
  use ExUnit.Case, async: true

  alias BananaBank.ViaCep.Client

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  describe "call/1" do
    test "successfuly returns cep info", %{bypass: bypass} do
      cep = "15355000"

      body = ~s({
        "bairro": "",
        "cep": "15355-000",
        "complemento": "",
        "ddd": "17",
        "gia": "3372",
        "ibge": "3518909",
        "localidade": "Guzolândia",
        "logradouro": "",
        "siafi": "6479",
        "uf": "SP"
      })

      # Resposta esperada.
      expected_response =
        {:ok,
         %{
           "bairro" => "",
           "cep" => "15355-000",
           "complemento" => "",
           "ddd" => "17",
           "gia" => "3372",
           "ibge" => "3518909",
           "localidade" => "Guzolândia",
           "logradouro" => "",
           "siafi" => "6479",
           "uf" => "SP"
         }}

      Bypass.expect(bypass, "GET", "/15355000/json", fn conn ->
        conn
        |> Plug.Conn.put_resp_content_type("application/json")
        |> Plug.Conn.resp(200, body)
      end)

      response =
        bypass.port
        |> endpoint_url()
        |> Client.call(cep)

      assert response == expected_response
    end
  end

  defp endpoint_url(port), do: "http://localhost:#{port}"
end
