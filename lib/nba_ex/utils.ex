defmodule NbaEx.Utils do
  @base_url     "http://data.nba.net/prod/"
  @base_version "v1"
  @year         "2018"

  def build_url(endpoint = "pbp", date, game_id, period),
    do: base_url() <> "#{date}/#{game_id}_#{endpoint}_#{period}.json"

  def build_url(endpoint = "boxscore.json", date, game_id),
    do: base_url() <> date <> "/#{game_id}_#{endpoint}"

  def build_url(endpoint, param) do
    case endpoint do
      "gamelog.json"    -> base_url() <> @year <> "/players/#{param}_#{endpoint}"
      "leaders.json"    -> base_url() <> @year <> "/teams/#{param}/#{endpoint}"
      "roster.json"     -> base_url() <> @year <> "/teams/#{param}/#{endpoint}"
      "schedule.json"   -> base_url() <> @year <> "/teams/#{param}/#{endpoint}"
      "scoreboard.json" -> base_url() <> param <> "/#{endpoint}"
    end
  end

  def build_url(endpoint = "teams_config.json"), do: @base_url  <> @year <> "/#{endpoint}"
  def build_url(endpoint),                       do: base_url() <> @year <> "/#{endpoint}"

  def current_date do
    Timex.now("America/Los_Angeles")
    |> DateTime.to_date()
    |> Date.to_iso8601(:basic)
  end

  defp base_url, do: @base_url <> @base_version <> "/"
end
