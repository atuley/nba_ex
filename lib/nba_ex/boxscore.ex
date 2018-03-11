defmodule NbaEx.Boxscore do
  alias NbaEx.{Constants, Endpoints, Game}

  defstruct [
    :gameId
  ]

  def get_boxscore(date, game_id) do
    HTTPoison.get!("#{Constants.base_url}/#{Constants.base_version}/#{date}/#{game_id}_#{Endpoints.boxscore}").body
    |> Poison.decode!(as: %{"basicGameData" => %Game{}})
    |> grab_game
  end

  def grab_game(%{"basicGameData" => game}) do
    game
  end
end
