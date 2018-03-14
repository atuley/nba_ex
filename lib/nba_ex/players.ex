defmodule NbaEx.Players do
  alias NbaEx.{Player, Utils}

  @endpoint "players.json"

  def all do
    response = @endpoint
    |> Utils.build_url
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!(as: %{"league" => %{"standard" => [%Player{}]}})

    response["league"]["standard"]
  end
end
