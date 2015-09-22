defmodule BitPayTestHelper.Environment.Test do
  use ExUnit.Case
  alias BitPayTestHelper.Environment, as: Bpe

  defmodule TestWriter do
    def write(".bpenv", "export BITPAYPEM=\"testpem\"\nexport BITPAYAPI=testpi"), do: :ok
  end

  test "writer will return ok and message" do
    api = "testpi"
    pem = "testpem"
    Bpe.write(api, pem, TestWriter) == {:ok, "Please run 'source .bpenv' to set variables"}
  end

  test "get_client returns client from environment variables" do 
    api = "https://test.api"
    pem = "-----BEGIN EC PRIVATE KEY-----\nMHQCAQEEICILk+YmXQxe8L\n-----END EC PRIVATE KEY-----\n\n"
    System.put_env("BITPAYAPI", api)
    System.put_env("BITPAYPEM", pem)
    assert Bpe.get_client == {:ok, %BitPay.WebClient{uri: api, pem: pem}}
  end

end
