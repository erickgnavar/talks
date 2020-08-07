defmodule Demo.GymTest do
  use ExUnit.Case
  alias Demo.Gym
  import Mox

  test "fight/2 must select winner using base_experience" do
    Demo.PokeApiMock
    |> expect(:pokemon_info, fn "pikachu" ->
      {:ok, %{"base_experience" => 100}}
    end)
    |> expect(:pokemon_info, fn "raichu" ->
      {:ok, %{"base_experience" => 200}}
    end)

    poke1 = "pikachu"
    poke2 = "raichu"

    assert {:ok, "raichu"} = Gym.fight(poke1, poke2)
  end

  test "fight/2 returns error when any of the pokemons data is not available" do
    Demo.PokeApiMock
    |> expect(:pokemon_info, fn "pikachu" ->
      {:ok, %{"base_experience" => 100}}
    end)
    |> expect(:pokemon_info, fn "raichu" ->
      {:error, "HTTP error"}
    end)

    poke1 = "pikachu"
    poke2 = "raichu"

    assert {:error, _reason} = Gym.fight(poke1, poke2)
  end
end
