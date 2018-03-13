defmodule NbaEx.Teams do
  alias NbaEx.{Constants, Endpoints, Team}

  def all do
    HTTPoison.get!("#{Constants.base_url}/#{Constants.base_version}/#{Constants.year}/#{Endpoints.teams}").body
    |> Poison.decode!(as: %{"league" => %{"standard" => [%Team{}]}})
    |> reject_non_nba_teams
  end

  defp reject_non_nba_teams(%{"league" => %{"standard" => teams}}) do
    teams
    |> Stream.reject(fn(team) -> team.isNBAFranchise == false end)
    |> Enum.to_list
  end
end
