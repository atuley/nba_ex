defmodule NbaEx.Coaches do
  alias NbaEx.{Coach, Utils}

  @endpoint "coaches.json"

  def all do
    response = @endpoint
    |> Utils.build_url
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!(as: %{"league" => %{"standard" => [%Coach{}]}})

    response["league"]["standard"]
  end
end
