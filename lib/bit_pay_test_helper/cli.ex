defmodule BitPayTestHelper.CLI do

  def main(argv) do
    parse_args(argv) |>
    elem(1) |>
    IO.puts
  end

  @doc ~S"""
  parses command line arguments

  ## Examples:
  iex> BitPayTestHelper.CLI.parse_args(["--help"])
  {:ok, "\n The BitPay Test Helper is a utility for building the required test environment to run the tests for many BitPay Libraries, including the Elixir, Go, and Ruby Libraries.\n   \n\tbpth new <uri>\twrites a file '.bpenv' which can be sourced to set BITPAYPEM and BITPAYAPI (equal to <uri>)\n\tbpth pair\t\tuses the env variables BITPAYPEM and BITPAYAPI to retrieve a merchant token pairing code\n"}
"""

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean ])
    case parse do
      { [ help: true ], _, _ } -> help
      { _, ["new", url], _ } -> write url
      { _, ["pair"], _ } -> pair
      _ -> help 
    end
  end

  defp pair do
    BitPayTestHelper.Environment.get_client |>
    BitPayTestHelper.Connector.pair BitPay.WebClient
  end

  defp write url do
    pem = BitPay.KeyUtils.generate_pem 
          |> String.replace("\n", "\\n")
    BitPayTestHelper.Environment.write url, pem, File
  end

  defp help do
    {:ok, "\n The BitPay Test Helper is a utility for building the required test environment to run the tests for many BitPay Libraries, including the Elixir, Go, and Ruby Libraries.\n   \n\tbpth new <uri>\twrites a file '.bpenv' which can be sourced to set BITPAYPEM and BITPAYAPI (equal to <uri>)\n\tbpth pair\t\tuses the env variables BITPAYPEM and BITPAYAPI to retrieve a merchant token pairing code\n"}
  end
end

