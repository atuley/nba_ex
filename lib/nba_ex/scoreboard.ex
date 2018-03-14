defmodule NbaEx.Scoreboard do
  alias NbaEx.{Constants, Endpoints, Game, Utils}

  defstruct [
    games: [],
    numGames: ""
  ]

  # TODO find player id function
  # TODO This is UTC
  # TODO Add is active field to know if game is complete
  # TODO error catching
  # TODO structs file: and   structs folder
  # defmodule Foo do
  #   defmodule Bar do
  #     defstruct ...
  #   end
  #
  #   defmodule Baz do
  #     defstruct ...
  #   end
  # end

  def get_current_scoreboard do
    get_scoreboard(Utils.current_date)
  end

  def get_scoreboard(date) do
    HTTPoison.get!("#{Constants.base_url}/#{Constants.base_version}/#{date}/#{Endpoints.scoreboard}").body
    |> Poison.decode!(as: %NbaEx.Scoreboard{games: [%Game{}]})
  end
end
