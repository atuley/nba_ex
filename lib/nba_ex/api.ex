defmodule NbaEx.Api do
  alias NbaEx.{Game, PlayByPlay, Player, Utils}

  @pbp      "pbp"
  @roster   "roster.json"
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

  def team_roster(team_name) do
    response = @roster
    |> Utils.build_url(team_name)
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!(as: %{"league" => %{"standard" => %{"players" => [%Player{}]}}})

    response["league"]["standard"]["players"]
  end
end
