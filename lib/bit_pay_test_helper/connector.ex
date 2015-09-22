defmodule BitPayTestHelper.Connector do
  def pair {:ok, client}, mod do
    mod.get_pairing_code client, :merchant 
  end
end
