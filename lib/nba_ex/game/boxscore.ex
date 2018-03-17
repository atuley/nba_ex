defmodule NbaEx.Boxscore do
  alias NbaEx.{Game, PlayerStat, TeamStat}

  defstruct game: %Game{},
            home_team_stats: %TeamStat{},
            away_team_stats: %TeamStat{},
            player_stats: [%PlayerStat{}]
end
