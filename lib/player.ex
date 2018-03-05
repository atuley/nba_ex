defmodule NbaEx.Player do
  alias NbaEx.Player
  defstruct [
    name: "Stephen Curry",
    points_per_game: 0
  ]

  def basic_stats do
    HTTPoison.get!("http://stats.nba.com/stats/playerprofilev2/?PerMode=PerGame&PlayerID=201939", [
                            "user-agent": ('Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36'),
                            "Dnt": "1",
                            "Accept": "application/json",
                            "Accept-Language": "en",
                            "origin": "http://stats.nba.com"
                          ], [timeout: 10_000, recv_timeout: 10_000]).body
    |> Poison.decode!
    |> grab_stats
  end

  defp grab_stats(%{"resultSets" => sets}) do
    sets
    |> List.first
    |> grab_row_set
  end

  defp grab_row_set(%{"rowSet" => seasons}) do
    seasons
    |> List.last
    |> map_to_struct
  end

  defp map_to_struct(current_season_values) do
    %Player{points_per_game: current_season_values |> List.last}
  end
end
