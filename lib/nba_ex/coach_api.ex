defmodule NbaEx.CoachApi do
  alias NbaEx.Utils

  @coaches "coaches.json"

  def all do
    response = @coaches
    |> Utils.build_url
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Jason.decode!()

    response["league"]["standard"]
  end
end
