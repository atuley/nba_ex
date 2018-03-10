defmodule NbaEx.Teams do
  alias NbaEx.{Constants, Endpoints, Team}

  def all do
    HTTPoison.get!("#{Constants.base_url}/#{Constants.base_version}/2017/#{Endpoints.teams}").body
    |> Poison.decode!(as: %{"league" => %{"standard" => [%Team{}]}})
    |> reject_non_nba_teams
  end

  defp reject_non_nba_teams(response) do
    response["league"]["standard"]
    |> Stream.reject(fn(team) -> team.isNBAFranchise == false end)
    |> Enum.to_list
  end
end
