defmodule BitPayTestHelper.Connector.Test do
  use ExUnit.Case

  defmodule TestClient do
    defstruct uri: nil, pem: nil
    def get_pairing_code client, :merchant do
      {:ok, "abcDEF7"}  
    end
  end

  test "pair test returns the pairing code" do 
    assert BitPayTestHelper.Connector.pair( {:ok, %TestClient{}}, TestClient) == {:ok, "abcDEF7"}
  end

end

