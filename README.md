BitPay Test Helper
=========

Running automated tests with BitPay libraries usually requires setting some environment variables and associating them with your test account. The BitPay Test Helper is a simple command line utility that will set the command line variables for some of the libraries, including the Go, Ruby, and Elixir libraries.

The Test Helper is written in Elixir, version 1.0.5, so you will need to install Erlang 17.5 or Elixir in order to run the binary. Most package managers will have Erlang or Elixir. It isn't strictly neccessary to have Elixir as well as Erlang, but install instructions for Elixir are a bit clearer and can be found on the [Elixir web site](http://elixir-lang.org/install.html).

Once you have Erlang/Elixir installed, just place the binary bpth somewhere in your PATH. There are two commands `bpth new <url>` and `bpth pair`. The first command creates a new file in the folder where it is run called `.bpenv`. An example shell session is shown below.

```shell
$ bpth new https://test.bitpay.com
Please run 'source .bpenv' to set variables
$ source .bpenv
$ bpth pair
HqeBHez
$
```

The output string from `bpth pair` is a pairing code for a merchant token. You can approve the token by logging into your dashboard and looking under "Payment Tools" and then "Manage API tokens".
