defmodule Mutant.Mixfile do
  use Mix.Project

  def project do
    [app: :mutant,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     description: description,
     package: package]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    []
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    []
  end

  defp description do
    """
    Now you can create mutable structs, use this with care and only as a last resort
    """
  end

  defp package do
    [# These are the default files included in the package
     files: ["lib", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
     maintainers: ["Michel Perez"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/hackersguildco/Mutant",
              "Docs" => "https://github.com/hackersguildco/Mutant"}]
  end
end
