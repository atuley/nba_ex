defmodule NbaEx do
  alias NbaEx.{Boxscore, Players, Scoreboard, Teams}

  def boxscore(date, game_id) do
    Boxscore.get_boxscore(date, game_id)
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

  # allstarRoster: "/prod/v1/allstar/2017/AS_roster.json",
  # leagueRosterCoaches: "/prod/v1/2017/coaches.json",
  # leagueSchedule: "/prod/v1/2017/schedule.json",
  # leagueConfStandings: "/prod/v1/current/standings_conference.json",
  # leagueDivStandings: "/prod/v1/current/standings_division.json",
  # leagueUngroupedStandings: "/prod/v1/current/standings_all.json",
  # leagueMiniStandings: "/prod/v1/current/standings_all_no_sort_keys.json",
  # leagueTeamStatsLeaders: "/prod/v1/2017/team_stats_rankings.json",
  # leagueLastFiveGameTeamStats: "/prod/v1/2017/team_stats_last_five_games.json",
  # previewArticle: "/prod/v1/{{gameDate}}/{{gameId}}_preview_article.json",
  # recapArticle: "/prod/v1/{{gameDate}}/{{gameId}}_recap_article.json",
  # gameBookPdf: "/prod/v1/{{gameDate}}/{{gameId}}_Book.pdf",
  # miniBoxscore: "/prod/v1/{{gameDate}}/{{gameId}}_mini_boxscore.json",
  # pbp: "/prod/v1/{{gameDate}}/{{gameId}}_pbp_{{periodNum}}.json",
  # leadTracker: "/prod/v1/{{gameDate}}/{{gameId}}_lead_tracker_{{periodNum}}.json",

  # boxscore: "/prod/v1/{{gameDate}}/{{gameId}}_boxscore.json",

  # playerGameLog: "/prod/v1/2017/players/{{personId}}_gamelog.json",
  # playerProfile: "/prod/v1/2017/players/{{personId}}_profile.json",
  # playerUberStats: "/prod/v1/2017/players/{{personId}}_uber_stats.json",
  # teamSchedule: "/prod/v1/2017/teams/{{teamUrlCode}}/schedule.json",
  # teamsConfig: "/prod/2017/teams_config.json",
  # teamRoster: "/prod/v1/2017/teams/{{teamUrlCode}}/roster.json",
  # teamsConfigYear: "/prod/{{seasonScheduleYear}}/teams_config.json",
  # teamScheduleYear: "/prod/v1/{{seasonScheduleYear}}/teams/{{teamUrlCode}}/schedule.json",
  # teamLeaders: "/prod/v1/2017/teams/{{teamUrlCode}}/leaders.json",
  # teamScheduleYear2: "/prod/v1/{{seasonScheduleYear}}/teams/{{teamId}}/schedule.json",
  # teamLeaders2: "/prod/v1/2017/teams/{{teamId}}/leaders.json",
  # playoffsBracket: "/prod/v1/2017/playoffsBracket.json",
  # playoffSeriesLeaders: "/prod/v1/2017/playoffs_{{seriesId}}_leaders.json"
end
