# Mutant

Now you can create mutable structs, use this with care and only as a last resort

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  Add mutant to your list of dependencies in `mix.exs`:
  ```elixir
  def deps do
    [{:mutant, "~> 0.0.1"}]
  end
  ```      

An example:
  ```elixir
  defmodule MyMutant do
    use Mutant, name: ""
  end

  test "a mutant can change it's name" do
    mutant = MyMutant.new(name: "demo")
    assert MyMutant.get_name(mutant) == "demo"
    MyMutant.set_name(mutant, "new")
    assert MyMutant.get_name(mutant) == "new"
  end
  ```
