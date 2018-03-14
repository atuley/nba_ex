defmodule NbaEx.Scoreboard do
  alias NbaEx.{Game, Utils}

  @endpoint "scoreboard.json"

  defstruct [
    games: [],
    numGames: ""
  ]

  def get_scoreboard(date) do
    @endpoint
    |> Utils.build_url(date)
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!(as: %NbaEx.Scoreboard{games: [%Game{}]})
  end
  def get_scoreboard, do: get_scoreboard(Utils.current_date)
end
