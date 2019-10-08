defmodule NbaEx.GameApi do
  alias NbaEx.Utils

  @boxscore   "boxscore.json"
  @pbp        "pbp"
  @scoreboard "scoreboard.json"

  def get_boxscore(date, game_id) do
    @boxscore
    |> Utils.build_url(date, game_id)
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()
    |> build_boxscore
  end

  def play_by_play(date, game_id, period) do
    response = @pbp
    |> Utils.build_url(date, game_id, period)
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()

    response["plays"]
  end

  def get_scoreboard, do: Utils.current_date() |> get_scoreboard()
  def get_scoreboard(date) do
    @scoreboard
    |> Utils.build_url(date)
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()
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
    %{
      "basicGameData" => game,
      "stats" => %{
        "vTeam" => away_team_stats,
        "hTeam" => home_team_stats,
        "activePlayers" => player_stats
      }
    }
  end
  defp build_boxscore(%{"basicGameData" => game}), do: %{"basicGameData" => game}
end
