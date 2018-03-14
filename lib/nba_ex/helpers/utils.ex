defmodule NbaEx.Utils do
  @base_url     "http://data.nba.net/prod/"
  @base_version "v1/"
  @year         "2017/"

  def build_url("boxscore.json", date, game_id), do: base_url() <> date <> "/#{game_id}_boxscore.json"
  def build_url("players.json"),                 do: base_url() <> @year <> "players.json"
  def build_url(_),                              do: {:error, "Endpoint does not exist"}

  def current_date do
    Date.utc_today
    |> Date.to_iso8601(:basic)
  end

  def base_url do
    @base_url <> @base_version
  end


  # def build_url(endpoint, params) do
  #   "nothing"
  # end
end
