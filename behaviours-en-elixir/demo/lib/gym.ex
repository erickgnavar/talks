defmodule Demo.Gym do
  @moduledoc """
  Pokemon gym stuff
  """

  @doc """
  Compare 2 pokemon stats and get a winner
  """
  @spec fight(String.t(), String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def fight(pokemon1_name, pokemon2_name) do
    poke_service = Application.get_env(:demo, :poke_service)

    with {:ok, pokemon1_data} <- poke_service.pokemon_info(pokemon1_name),
         {:ok, pokemon2_data} <- poke_service.pokemon_info(pokemon2_name) do
      if pokemon1_data["base_experience"] > pokemon2_data["base_experience"] do
        {:ok, pokemon1_name}
      else
        {:ok, pokemon2_name}
      end
    end
  end
end
