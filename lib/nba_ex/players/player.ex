defmodule NbaEx.Player do
  alias NbaEx.{Constants, Endpoints, PlayerGameLog, Team}

  defstruct [
    firstName: "",
    lastName: "",
    personId: "",
    teamId: "",
    jersey: "",
    isActive: "",
    pos: "",
    heightFeet: "",
    heightInches: "",
    weightPounds: "",
    dateOfBirthUTC: "",
    teams: [%Team{}],
    nbaDebutYear: "",
    yearsPro: "",
    collegeName: "",
    country: ""
  ]

  def game_log(player_id) do
    HTTPoison.get!("#{Constants.base_url}/#{Constants.base_version}/#{Constants.year}/players/#{player_id}_#{Endpoints.player_game_log}").body
    |> Poison.decode!(as: %{"league" => %{"standard" => [%PlayerGameLog{}]}})
    |> grab_game_logs
  end

  defp grab_game_logs(%{"league" => %{"standard" => player_game_logs}}), do: player_game_logs
end
