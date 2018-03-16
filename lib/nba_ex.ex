defmodule NbaEx do
  alias NbaEx.{CoachService, GameService, PlayerService, TeamService}

  def boxscore(date, game_id),             do: GameService.get_boxscore(date, game_id)
  def coaches,                             do: CoachService.all()
  def play_by_play(date, game_id, period), do: GameService.play_by_play(date, game_id, period)
  def player_game_log_for(player_id),      do: PlayerService.game_log(player_id)
  def players,                             do: PlayerService.all()
  def scoreboard,                          do: GameService.get_scoreboard()
  def scoreboard_for(date),                do: GameService.get_scoreboard(date)
  def teams,                               do: TeamService.all()
  def teams_config,                        do: TeamService.teams_config()
  def team_leaders(team_name),             do: TeamService.team_leaders(team_name)
  def team_roster(team_name),              do: TeamService.team_roster(team_name)
  def team_schedule(team_name),            do: TeamService.team_schedule(team_name)

end
