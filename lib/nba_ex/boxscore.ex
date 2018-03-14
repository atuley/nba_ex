defmodule NbaEx.Boxscore do
  alias NbaEx.{Game, PlayerStat, TeamStat, Utils}

  @endpoint "boxscore.json"

  defstruct [
    game: nil,
    home_team_stats: %TeamStat{},
    away_team_stats: %TeamStat{},
    player_stats: nil
  ]

  def get_boxscore(date, game_id) do
    @endpoint
    |> Utils.build_url(date, game_id)
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!(as: %{"basicGameData" => %Game{}, "stats" => %{"vTeam" => %TeamStat{}, "hTeam" => %TeamStat{}, "activePlayers" => [%PlayerStat{}]}})
    |> build_boxscore
  end

  defp build_boxscore(%{"basicGameData" => game,"stats" => %{"vTeam" => away_team_stats, "hTeam" => home_team_stats, "activePlayers" => player_stats}}) do
    %NbaEx.Boxscore{game: game, away_team_stats: away_team_stats, home_team_stats: home_team_stats, player_stats: player_stats}
  end
end
