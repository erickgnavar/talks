defmodule Demo.PokeApiMemory do
  @moduledoc """
  In memory implementation of poke api spec
  """
  @behaviour Demo.PokeApiSpec
  @db %{
    "pikachu" => %{"base_experience" => 100},
    "raichu" => %{"base_experience" => 200},
    "pichu" => %{"base_experience" => 50}
  }

  @impl true
  def pokemon_info(pokemon_name) do
    case Map.get(@db, pokemon_name) do
      nil -> {:error, "not found"}
      poke_data -> {:ok, poke_data}
    end
  end
end
