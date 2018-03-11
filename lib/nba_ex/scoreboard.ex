defmodule NbaEx.Scoreboard do
  alias NbaEx.{Constants, Endpoints, Game, Helpers}

  defstruct [
    games: [],
    numGames: ""
  ]

  # TODO This is UTC
  def get_current_scoreboard do
    get_scoreboard(Helpers.current_date)
  end

  def get_scoreboard(date) do
    HTTPoison.get!("#{Constants.base_url}/#{Constants.base_version}/#{date}/#{Endpoints.scoreboard}").body
    |> Poison.decode!(as: %NbaEx.Scoreboard{games: [%Game{}]})
  end
end
