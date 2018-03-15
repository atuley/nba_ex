defmodule NbaEx do
  alias NbaEx.{Api, Coaches, Boxscore, Player, Players, Scoreboard, Teams}

  def boxscore(date, game_id),             do: Boxscore.get_boxscore(date, game_id)
  def coaches,                             do: Coaches.all()
  def play_by_play(date, game_id, period), do: Api.play_by_play(date, game_id, period)
  def player_game_log_for(player_id),      do: Player.game_log(player_id)
  def players,                             do: Players.all()
  def scoreboard,                          do: Scoreboard.get_scoreboard()
  def scoreboard_for(date),                do: Scoreboard.get_scoreboard(date)
  def teams,                               do: Teams.all()
  def teams_config,                        do: Api.teams_config()
  def team_leaders(team_name),             do: Api.team_leaders(team_name)
  def team_roster(team_name),              do: Api.team_roster(team_name)
  def team_schedule(team_name),            do: Api.team_schedule(team_name)

end
