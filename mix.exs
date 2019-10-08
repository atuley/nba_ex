defmodule NbaEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :nba_ex,
      description: "Wrapper API for data.nba.net",
      version: "0.1.2",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      name: "nba_ex",
      source_url: "https://github.com/atuley/nba_ex"
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
      {:ex_doc, "~> 0.21.2"},
      {:exvcr, "~> 0.10.1", only: :test},
      {:httpoison, "~> 1.0"},
      {:timex, "~> 3.2"},
      {:jason, "~> 1.1"}
    ]
  end

  defp package() do
    [
      name: "nba_ex",
      maintainers: ["Alex Tuley"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/atuley/nba_ex"}
    ]
  end
end
