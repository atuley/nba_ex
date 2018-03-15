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


  # pbp: "/prod/v1/20180314/0021701017_pbp_3.json",
  # teamSchedule: "/prod/v1/2017/teams/{{teamUrlCode}}/schedule.json",
  # teamsConfig: "/prod/2017/teams_config.json",
  # teamRoster: "/prod/v1/2017/teams/{{teamUrlCode}}/roster.json",
  # teamLeaders: "/prod/v1/2017/teams/{{teamUrlCode}}/leaders.json",

end
