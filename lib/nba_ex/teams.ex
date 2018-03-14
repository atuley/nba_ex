defmodule NbaEx.Teams do
  alias NbaEx.{Team, Utils}

  @endpoint "teams.json"

  def all do
    @endpoint
    |> Utils.build_url
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!(as: %{"league" => %{"standard" => [%Team{}]}})
    |> reject_non_nba_teams
  end

  defp reject_non_nba_teams(%{"league" => %{"standard" => teams}}) do
    teams
    |> Stream.reject(fn(team) -> team.isNBAFranchise == false end)
    |> Enum.to_list
  end
end
