defmodule NbaEx.Endpoints do
  @players "players.json"
  @scoreboard "scoreboard.json"
  @teams "teams.json"

  def players, do: @players
  def scoreboard, do: @scoreboard
  def teams, do: @teams
end
