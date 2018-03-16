defmodule NbaEx.CoachService do
  alias NbaEx.{Coach, Utils}

  @coaches "coaches.json"

  def all do
    response = @coaches
    |> Utils.build_url
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!(as: %{"league" => %{"standard" => [%Coach{}]}})

    response["league"]["standard"]
  end
end
