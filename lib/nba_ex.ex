defmodule NbaEx do
  alias NbaEx.{Coaches, Boxscore, Player, Players, Scoreboard, Teams}

  def boxscore(date, game_id) do
    Boxscore.get_boxscore(date, game_id)
  end

  def coaches do
    Coaches.all()
  end

  def player_game_log_for(player_id) do
    Player.game_log(player_id)
  end

  def players do
    Players.all()
  end

  def scoreboard do
    Scoreboard.get_current_scoreboard()
  end

  def scoreboard_for(date) do
    Scoreboard.get_scoreboard(date)
  end

  def teams do
    Teams.all()
  end

  # playerProfile: "/prod/v1/2017/players/{{personId}}_profile.json",

  # leagueRosterCoaches: "/prod/v1/2017/coaches.json",
  # leagueSchedule: "/prod/v1/2017/schedule.json",
  # pbp: "/prod/v1/{{gameDate}}/{{gameId}}_pbp_{{periodNum}}.json",
  # teamSchedule: "/prod/v1/2017/teams/{{teamUrlCode}}/schedule.json",
  # teamsConfig: "/prod/2017/teams_config.json",
  # teamRoster: "/prod/v1/2017/teams/{{teamUrlCode}}/roster.json",
  # teamLeaders: "/prod/v1/2017/teams/{{teamUrlCode}}/leaders.json",

end
