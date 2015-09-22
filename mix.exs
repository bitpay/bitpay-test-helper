defmodule BitPayTestHelper.Mixfile do
  use Mix.Project

  def project do
    [app: :bpth,
     version: "0.0.1",
     elixir: "~> 1.0",
     escript: escript_config,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :httpotion]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [{ :bitpay, "~> 0.2.4" },
     { :ibrowse, github: "cmullaparthi/ibrowse", tag: "v4.1.0" },
     { :httpotion, "~> 1.0.0"}   ]
  end

  def escript_config do
    [ main_module: BitPayTestHelper.CLI ]
  end
end
