defmodule Demo.PokeApiService do
  @moduledoc """
  PokeApiSpec implementation
  """
  @behaviour Demo.PokeApiSpec

  @pokemon_info_url "https://pokeapi.co/api/v2/pokemon/{name}"

  @impl true
  def pokemon_info(pokemon_name) do
    headers = [{"content-type", "application/json"}]
    url = String.replace(@pokemon_info_url, "{name}", pokemon_name)

    with {:ok, %Mojito.Response{status_code: 200, body: body}} <- Mojito.get(url, headers),
         {:ok, response_data} <- Jason.decode(body) do
      {:ok, response_data}
    else
      {:ok, %Mojito.Response{status_code: status_code, body: body}} ->
        {:error, "HTTP ERROR #{status_code}: #{body}"}
    end
  end
end
