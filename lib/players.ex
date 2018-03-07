defmodule NbaEx.Players do
  alias NbaEx.Players
  defstruct [

  ]

  def all do
    HTTPoison.get!("http://stats.nba.com/stats/commonallplayers/?LeagueID=00&Season=2017-18&IsOnlyCurrentSeason=1", [
                            "user-agent": ('Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36'),
                            "Dnt": "1",
                            "Accept": "application/json",
                            "Accept-Language": "en",
                            "origin": "http://stats.nba.com"
                          ], [timeout: 10_000, recv_timeout: 10_000]).body
    |> Poison.decode!
    |> get_players
  end

  def get_players(%{"resultSets" => [%{"rowSet" => [[_, "Abrines, Alex", firstLast | _] | _tail ]}]}) do
    %{firstLast: firstLast}
  end

  # def grab_players(%{"rowSet" => players}) do
  #   player
  # end
end
