defmodule NbaEx do
  @moduledoc """
  Wrapper API for data.nba.net
  """
  alias NbaEx.{CoachApi, GameApi, PlayerApi, TeamApi}

  @doc """
  Returns the boxscore for a given date(YYYYMMDD) and game id.

      iex> NbaEx.boxscore("20180316", "0021701032")
      %Boxscore{
        game: %Game{},
        home_team_stats: %TeamStat{},
        away_team_stats: %TeamStat{},
        player_stats: [%PlayerStat{}]
      }
  """
  @spec boxscore(String.t(), String.t()) ::
          NbaEx.Boxscore.t()
          | {:error, String.t()}
  def boxscore(date, game_id) do
    GameApi.get_boxscore(date, game_id)
  rescue
    Poison.SyntaxError ->
      {:error, "There was an error getting the boxscore for #{date} and #{game_id}"}
  end

  @doc """
  Returns all of the coaches in the league.

      iex> NbaEx.coaches()
      [
        %NbaEx.Coach{
          college: "Oklahoma",
          firstName: "Terry",
          isAssistant: true,
          lastName: "Stotts",
          personId: "1337",
          sortSequence: "25",
          teamId: "1610612757"
        },
        %NbaEx.Coach{
          college: "St. Bonaventure",
          firstName: "David",
          isAssistant: false,
          lastName: "Vanterpool",
          personId: "203150",
          sortSequence: "204",
          teamId: "1610612757"
        },
        ....
      ]
  """
  @spec coaches() :: [NbaEx.Coach.t()]
  def coaches, do: CoachApi.all()

  @doc """
  Returns individual plays for a specific period in a game.

      iex> NbaEx.play_by_play("20180317", "0021701044", 3)
      %NbaEx.PlayByPlay{
        plays: [
          %NbaEx.Play{
            clock: "12:00",
            description: "Start Period",
            eventMsgType: "12",
            hTeamScore: "60",
            isScoreChange: false,
            isVideoAvailable: false,
            personId: "",
            teamId: "",
            vTeamScore: "52"
          },
          ....
        ]
      }
  """
  @spec play_by_play(String.t(), String.t(), Integer.t()) ::
          NbaEx.PlayByPlay.t()
          | {:error, String.t()}
  def play_by_play(date, game_id, period) do
    GameApi.play_by_play(date, game_id, period)
  rescue
    Poison.SyntaxError ->
      {:error,
       "There was an error getting the play by play for a game with the following params: play_by_play
       (#{date}, #{game_id}, #{period})"}
  end

  @doc """
  Returns statistics and game information for the specified player's last three games.

      iex> NbaEx.player_game_log("1628432")
      [
        %NbaEx.PlayerGameLog{
          gameDateUTC: "2018-03-15",
          gameId: "0021701027",
          gameUrlCode: "20180315/PHXUTA",
          hTeam: %NbaEx.TeamScore{
            isWinner: true,
            score: "116",
            teamId: "1610612762",
            triCode: nil
          },
          isHomeGame: false,
          stats: %NbaEx.PlayerStat{
            assists: "0",
            blocks: nil,
            defReb: "2",
            ...
        }
      ]
  """
  @spec player_game_log(String.t()) ::
          [NbaEx.PlayerGameLog.t()]
          | {:error, String.t()}
  def player_game_log(player_id) do
    PlayerApi.game_log(player_id)
  rescue
    Poison.SyntaxError ->
      {:error, "There was an error getting the game log for a player with this id: #{player_id}"}
  end

  def players, do: PlayerApi.all()
  def scoreboard, do: GameApi.get_scoreboard()
  def scoreboard_for(date), do: GameApi.get_scoreboard(date)
  def teams, do: TeamApi.all()
  def teams_config, do: TeamApi.teams_config()
  def team_leaders(team_name), do: TeamApi.team_leaders(team_name)
  def team_roster(team_name), do: TeamApi.team_roster(team_name)
  def team_schedule(team_name), do: TeamApi.team_schedule(team_name)
end
