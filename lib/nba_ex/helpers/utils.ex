defmodule NbaEx.Utils do
  @base_url     "http://data.nba.net/prod/"
  @base_version "v1/"
  @year         "2017/"

  def build_url(endpoint = "boxscore.json", date, game_id), do: base_url() <> date  <> "/#{game_id}_#{endpoint}"
  def build_url(endpoint = "coaches.json"),                 do: base_url() <> @year <> endpoint
  def build_url(endpoint = "gamelog.json", player_id),      do: base_url() <> @year <> "players/#{player_id}_#{endpoint}"
  def build_url(endpoint = "players.json"),                 do: base_url() <> @year <> endpoint
  def build_url(endpoint = "scoreboard.json", date),        do: base_url() <> date  <> "/#{endpoint}"
  def build_url(endpoint = "teams.json"),                   do: base_url() <> @year <> endpoint
  def build_url(_),                                         do: "Endpoint does not exist"

  def current_date do
    Date.utc_today
    |> Date.to_iso8601(:basic)
  end

  defp base_url, do: @base_url <> @base_version
end
