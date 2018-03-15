defmodule NbaEx.Api do
  alias NbaEx.{Game, PlayByPlay, Utils}

  @pbp "pbp"
  @schedule "schedule.json"

  def play_by_play(date, game_id, period) do
    @pbp
    |> Utils.build_url(date, game_id, period)
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!(as: %PlayByPlay{})
  end

  def team_schedule(team_name) do
    response = @schedule
    |> Utils.build_url(team_name)
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!(as: %{"league" => %{"standard" => [%Game{}]}})

    response["league"]["standard"]
  end
end
