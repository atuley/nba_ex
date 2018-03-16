defmodule NbaEx.PlayerService do
  alias NbaEx.{Player, PlayerGameLog, Utils}

  @gamelog "gamelog.json"
  @players "players.json"

  def all do
    response = @players
    |> Utils.build_url
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!(as: %{"league" => %{"standard" => [%Player{}]}})

    response["league"]["standard"]
  end

  def game_log(player_id) do
    response = @gamelog
    |> Utils.build_url(player_id)
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!(as: %{"league" => %{"standard" => [%PlayerGameLog{}]}})

    response["league"]["standard"]
  end
end
