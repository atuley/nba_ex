defmodule NbaEx.Utils do
  @base_url     "http://data.nba.net/prod/"
  @base_version "v1/"
  @year         "2017/"

  def build_url(endpoint = "boxscore.json", date, game_id), do: base_url() <> date  <> "/#{game_id}_#{endpoint}"
  def build_url(endpoint = "gamelog.json", player_id),      do: base_url() <> @year <> "players/#{player_id}_#{endpoint}"
  def build_url(endpoint = "roster.json", team_name),       do: base_url() <> @year <> "teams/#{team_name}/#{endpoint}"
  def build_url(endpoint = "scoreboard.json", date),        do: base_url() <> date  <> "/#{endpoint}"
  def build_url(endpoint = "schedule.json", team_name),     do: base_url() <> @year <> "teams/#{team_name}/#{endpoint}"
  def build_url(endpoint = "pbp", date, game_id, period),   do: base_url() <> "#{date}/#{game_id}_#{endpoint}_#{period}.json"
  def build_url(endpoint = "teams_config.json"),            do: @base_url <> @year <> endpoint
  def build_url(endpoint),                                  do: base_url() <> @year <> endpoint

  def current_date do
    Date.utc_today
    |> Date.to_iso8601(:basic)
  end

  defp base_url, do: @base_url <> @base_version
end
