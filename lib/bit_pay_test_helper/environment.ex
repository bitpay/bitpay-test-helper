defmodule BitPayTestHelper.Environment do

  def write url, pem, writer do
    writer.write(".bpenv", "export BITPAYPEM=\"#{pem}\"\nexport BITPAYAPI=#{url}") |>
    verify_write "Please run 'source .bpenv' to set variables"
  end

  @doc """
  returns a client built from the environment variables
  """
  def get_client do
    pem = System.get_env("BITPAYPEM") |> String.replace("\\n", "\n")
    api = System.get_env("BITPAYAPI") 
    {:ok, %BitPay.WebClient{uri: api, pem: pem}}
  end

  defp verify_write(:ok, message), do: {:ok, message}
  defp verify_write({:error, message}, _), do: {:error, message}
end
