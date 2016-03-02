defmodule Mutant do
	@moduledoc """
	use this module

	defmodule MyMutant do
		use Mutant, name: ""
	end

	and you could create mutable structs
	"""

  defmacro __using__(fields) do
    names = fields |> Enum.map(fn(field) ->
      case field do
        {key, _} -> key
        key -> key
      end
    end)

    quote bind_quoted: [names: names, fields: fields] do
      defstruct agent: nil

      defmodule MutantStruct do
        defstruct fields
      end

      def new(fields_param) do
        {:ok, pid} = Agent.start_link(fn -> struct(MutantStruct, fields_param) end)
        struct(__MODULE__, agent: pid)
      end

      def status(mutant) do
        Agent.get(mutant.agent, fn(struct) -> struct end)
      end

      names |> Enum.each(fn name ->
        getter = String.to_atom("get_#{name}")
        setter = String.to_atom("set_#{name}")

        def unquote(getter)(mutant) do
          Agent.get(mutant.agent, fn(struct) ->
            struct |> Map.from_struct |> Map.get(unquote(name))
          end)
        end

        def unquote(setter)(mutant, value) do
          Agent.update(mutant.agent, fn(struct) ->
            struct |> Map.update!(unquote(name), fn(_) -> value end)
          end)
        end
      end)
    end
  end
end
