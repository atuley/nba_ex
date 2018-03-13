defmodule NbaEx.Endpoints do
  @boxscore        "boxscore.json"
  @player_game_log "gamelog.json"
  @players         "players.json"
  @scoreboard      "scoreboard.json"
  @teams           "teams.json"

  def boxscore,        do: @boxscore
  def player_game_log, do: @player_game_log
  def players,         do: @players
  def scoreboard,      do: @scoreboard
  def teams,           do: @teams
end
