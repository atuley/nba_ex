defmodule NbaEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :nba_ex,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.0"},
      {:exvcr, "~> 0.10.1", only: :test},
      {:poison, "~> 3.1"}
    ]
  end
end