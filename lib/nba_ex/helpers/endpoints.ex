defmodule NbaEx.Endpoints do
  @scoreboard "scoreboard.json"
  @teams "teams.json"

  def scoreboard, do: @scoreboard
  def teams, do: @teams
end
