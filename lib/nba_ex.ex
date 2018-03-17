defmodule NbaEx do
  alias NbaEx.{CoachApi, GameApi, PlayerApi, TeamApi}

  @doc """
  This is a test

      iex> Exiban.hello
      :world
  """
  def boxscore(date, game_id) do
    GameApi.get_boxscore(date, game_id)
  rescue
    Poison.SyntaxError ->
      {:error, "There was an error getting the boxscore for #{date} and #{game_id}"}
  end

  def coaches,                             do: CoachApi.all()
  def play_by_play(date, game_id, period), do: GameApi.play_by_play(date, game_id, period)
  def player_game_log_for(player_id),      do: PlayerApi.game_log(player_id)
  def players,                             do: PlayerApi.all()
  def scoreboard,                          do: GameApi.get_scoreboard()
  def scoreboard_for(date),                do: GameApi.get_scoreboard(date)
  def teams,                               do: TeamApi.all()
  def teams_config,                        do: TeamApi.teams_config()
  def team_leaders(team_name),             do: TeamApi.team_leaders(team_name)
  def team_roster(team_name),              do: TeamApi.team_roster(team_name)
  def team_schedule(team_name),            do: TeamApi.team_schedule(team_name)

end
