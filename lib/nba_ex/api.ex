defmodule NbaEx.Api do
  alias NbaEx.{Game, PlayByPlay, Player, TeamConfig, Utils}

  # Endpoints
  @pbp          "pbp"
  @roster       "roster.json"
  @schedule     "schedule.json"
  @teams_config "teams_config.json"

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

  def teams_config do
    response = @teams_config
    |> Utils.build_url
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!(as: %{"teams" => %{"config" => [%TeamConfig{}]}})

    response["teams"]["config"]
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
