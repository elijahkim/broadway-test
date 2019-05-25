defmodule Consumer.MixProject do
  use Mix.Project

  def project do
    [
      app: :consumer,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Consumer.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:broadway, "~> 0.3.0"},
      {:broadway_sqs, "~> 0.2.0"},
      {:hackney, "~> 1.9"},
      {:ex_aws, "~> 2.0"},
      {:ex_aws_sqs, "2.0.1"},
    ]
  end
end
