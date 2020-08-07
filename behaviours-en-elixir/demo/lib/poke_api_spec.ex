defmodule Demo.PokeApiSpec do
  @moduledoc """
  Pokemon API functions used in this project
  """

  @doc """
  Return a map with pokemon data for a given pokemon name
  """
  @callback pokemon_info(String.t()) :: {:ok, map} | {:error, String.t()}
end
