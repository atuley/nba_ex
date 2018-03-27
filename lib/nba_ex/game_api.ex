defmodule NbaEx.GameApi do
  alias NbaEx.{Game, PlayByPlay, PlayerStat, Scoreboard, TeamStat, Utils}

  @boxscore   "boxscore.json"
  @pbp        "pbp"
  @scoreboard "scoreboard.json"

  def get_boxscore(date, game_id) do
    @boxscore
    |> Utils.build_url(date, game_id)
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Poison.decode!(
      as: %{
        "basicGameData" => %Game{},
        "stats" => %{
          "vTeam" => %TeamStat{},
          "hTeam" => %TeamStat{},
          "activePlayers" => [%PlayerStat{}]
        }
      }
    )
    |> build_boxscore
  end

  def play_by_play(date, game_id, period) do
    @pbp
    |> Utils.build_url(date, game_id, period)
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Poison.decode!(as: %PlayByPlay{})
  end

  def get_scoreboard, do: Utils.current_date() |> get_scoreboard()
  def get_scoreboard(date) do
    @scoreboard
    |> Utils.build_url(date)
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Poison.decode!(as: %Scoreboard{games: [%Game{}]})
  end

  defp build_boxscore(%{
         "basicGameData" => game,
         "stats" => %{
           "vTeam" => away_team_stats,
           "hTeam" => home_team_stats,
           "activePlayers" => player_stats
         }
       })
  do
    %NbaEx.Boxscore{
      game: game,
      away_team_stats: away_team_stats,
      home_team_stats: home_team_stats,
      player_stats: player_stats
    }
  end
  defp build_boxscore(%{"basicGameData" => game}), do: %NbaEx.Boxscore{game: game}  
end
