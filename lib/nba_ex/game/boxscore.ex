defmodule NbaEx.Boxscore do
  alias NbaEx.TeamStat

  defstruct game: nil,
            home_team_stats: %TeamStat{},
            away_team_stats: %TeamStat{},
            player_stats: nil
end
