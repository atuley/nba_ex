defmodule NbaEx.Endpoints do
  @boxscore   "boxscore.json"
  @players    "players.json"
  @scoreboard "scoreboard.json"
  @teams      "teams.json"

  def boxscore,   do: @boxscore
  def players,    do: @players
  def scoreboard, do: @scoreboard
  def teams,      do: @teams
end
