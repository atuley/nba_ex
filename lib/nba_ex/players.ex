defmodule NbaEx.Players do
  alias NbaEx.{Endpoints, Utils, Player}

  @endpoint Endpoints.players

  def all do
    response = @endpoint
    |> Utils.build_url
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!(as: %{"league" => %{"standard" => [%Player{}]}})

    response["league"]["standard"]
  end
end
