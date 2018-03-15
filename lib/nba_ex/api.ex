defmodule NbaEx.Api do
  alias NbaEx.{PlayByPlay, Utils}

  @pbp "pbp"

  def play_by_play(date, game_id, period) do
    @pbp
    |> Utils.build_url(date, game_id, period)
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!(as: %PlayByPlay{})
  end
end
