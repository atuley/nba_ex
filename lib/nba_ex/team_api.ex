defmodule NbaEx.TeamApi do
  alias NbaEx.Utils

  @roster       "roster.json"
  @schedule     "schedule.json"
  @teams        "teams.json"
  @teams_config "teams_config.json"
  @team_leaders "leaders.json"

  def all do
    @teams
    |> Utils.build_url()
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()
    |> reject_non_nba_teams
  end

  def teams_config do
    response = @teams_config
    |> Utils.build_url()
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()

    response["teams"]["config"]
  end

  def team_leaders(team_name) do
    response = @team_leaders
    |> Utils.build_url(team_name)
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()

    response["league"]["standard"]
  end

  def team_roster(team_name) do
    response = @roster
    |> Utils.build_url(team_name)
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()

    response["league"]["standard"]["players"]
  end

  def team_schedule(team_name) do
    response = @schedule
    |> Utils.build_url(team_name)
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()

    response["league"]["standard"]
  end

  defp reject_non_nba_teams(%{"league" => %{"standard" => teams}}) do
    teams
    |> Stream.reject(fn team -> team["isNBAFranchise"] == false end)
    |> Enum.to_list()
  end
end
