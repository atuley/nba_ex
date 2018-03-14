defmodule NbaEx.Utils do
  @base_url     "http://data.nba.net/prod/"
  @base_version "v1/"
  @year         "2017/"

  def build_url("players.json"), do: base_url() <> "players.json"
  def build_url(_), do: {:error, "Endpoint does not exist"}

  def current_date do
    Date.utc_today
    |> Date.to_iso8601(:basic)
  end

  def base_url do
    @base_url <> @base_version <> @year
  end


  # def build_url(endpoint, params) do
  #   "nothing"
  # end
end
