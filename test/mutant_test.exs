defmodule MutantTest do
  use ExUnit.Case
  doctest Mutant

  defmodule MyMutant do
    use Mutant, name: ""
  end

  test "a mutant can change it's name" do
    mutant = MyMutant.new(name: "demo")
    assert MyMutant.get_name(mutant) == "demo"
    MyMutant.set_name(mutant, "new")
    assert MyMutant.get_name(mutant) == "new"
  end
end
