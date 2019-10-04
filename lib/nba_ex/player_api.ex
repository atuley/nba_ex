defmodule NbaEx.PlayerApi do
  alias NbaEx.Utils

  @gamelog "gamelog.json"
  @players "players.json"

  def all do
    response = @players
    |> Utils.build_url
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Jason.decode!()

    response["league"]["standard"]
  end

  def game_log(player_id) do
    response = @gamelog
    |> Utils.build_url(player_id)
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Jason.decode!()

    response["league"]["standard"]
  end
end
