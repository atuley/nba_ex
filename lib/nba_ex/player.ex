defmodule NbaEx.Player do
  alias NbaEx.{PlayerGameLog, Team, Utils}

  @endpoint "gamelog.json"

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

  # TODO create function to grab response["league"]["standard"]
  def game_log(player_id) do
    response = @endpoint
    |> Utils.build_url(player_id)
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!(as: %{"league" => %{"standard" => [%PlayerGameLog{}]}})

    response["league"]["standard"]
  end
end
