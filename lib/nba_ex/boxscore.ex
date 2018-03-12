defmodule NbaEx.Boxscore do
  alias NbaEx.{Constants, Endpoints, Game, PlayerStat, TeamStat}

  defstruct [
    game: nil,
    home_team_stats: %TeamStat{},
    away_team_stats: %TeamStat{},
    player_stats: nil
  ]

  # TODO build url function

  def get_boxscore(date, game_id) do
    HTTPoison.get!("#{Constants.base_url}/#{Constants.base_version}/#{date}/#{game_id}_#{Endpoints.boxscore}").body
    |> Poison.decode!(as: %{"basicGameData" => %Game{}, "stats" => %{"vTeam" => %TeamStat{}, "hTeam" => %TeamStat{}, "activePlayers" => [%PlayerStat{}]}})
    |> grab_boxscore
  end

  defp grab_boxscore(%{"basicGameData" => game,"stats" => %{"vTeam" => away_team_stats, "hTeam" => home_team_stats, "activePlayers" => player_stats}}) do
    %NbaEx.Boxscore{game: game, away_team_stats: away_team_stats, home_team_stats: home_team_stats, player_stats: player_stats}
  end
end
