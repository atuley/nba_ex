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
          %NbaEx.Boxscore{}
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
  @spec coaches() :: [%NbaEx.Coach{}]
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
          %NbaEx.PlayByPlay{}
          | {:error, String.t()}
  def play_by_play(date, game_id, period) do
    GameApi.play_by_play(date, game_id, period)
  rescue
    Poison.SyntaxError ->
      {:error,
       "There was an error getting the play by play for a game with the following params: play_by_play
       (#{date}, #{game_id}, #{period}). Make sure the date is in YYYYMMDD format"}
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
          [%NbaEx.PlayerGameLog{}]
          | {:error, String.t()}
  def player_game_log(player_id) do
    PlayerApi.game_log(player_id)
  rescue
    Poison.SyntaxError ->
      {:error, "There was an error getting the game log for a player with this id: #{player_id}"}
  end

  @doc """
  Returns a list of all active players.

      iex> NbaEx.players()
      [
        %NbaEx.Player{
          collegeName: "Texas",
          country: "USA",
          dateOfBirthUTC: "1985-07-19",
          firstName: "LaMarcus",
          heightFeet: "6",
          ...
        },
        ...
      ]
  """
  @spec players() :: [%NbaEx.Player{}]
  def players, do: PlayerApi.all()

  @doc """
  Returns the scoreboard for the current date in PST.

      iex> NbaEx.scoreboard()
      %NbaEx.Scoreboard{
        games: [
          %NbaEx.Game{
            arena: %NbaEx.Arena{
              city: "Milwaukee",
              country: "USA",
              name: "BMO Harris Bradley Center",
              stateAbbr: "WI"
            },
            clock: "",
            endTimeUTC: "2018-03-17T23:34:00.000Z",
            ...
          },
          ...
        ]
      }
  """
  @spec scoreboard() :: %NbaEx.Scoreboard{}
  def scoreboard, do: GameApi.get_scoreboard()

  @doc """
  Returns the scoreboard for a given date.

      iex> NbaEx.scoreboard_for("20180317")
      %NbaEx.Scoreboard{
        games: [
          %NbaEx.Game{
            arena: %NbaEx.Arena{
              city: "Milwaukee",
              country: "USA",
              name: "BMO Harris Bradley Center",
              stateAbbr: "WI"
            },
            clock: "",
            endTimeUTC: "2018-03-17T23:34:00.000Z",
            ...
          },
          ...
        ]
      }
  """
  @spec scoreboard_for(String.t()) ::
          %NbaEx.Scoreboard{}
          | {:error, String.t()}
  def scoreboard_for(date) do
    GameApi.get_scoreboard(date)
  rescue
    Poison.SyntaxError ->
      {:error, "There was an error getting the scoreboard for this date: #{date}. Make sure the date is in YYYYMMDD format"}
  end

  @doc """
  Returns all of teams in the league.

      iex> NbaEx.teams()
      [
        %NbaEx.Team{
          city: "Atlanta",
          confName: "East",
          divName: "Southeast",
          fullName: "Atlanta Hawks",
          isNBAFranchise: true,
          nickname: "Hawks",
          teamId: "1610612737",
          tricode: "ATL"
        },
        ...
      ]
  """
  @spec teams() :: [%NbaEx.Team{}]
  def teams, do: TeamApi.all()

  @doc """
  Returns team colors, team id, tricode, etc..

      iex> NbaEx.teams_config()
      [
        %NbaEx.TeamConfig{
          primaryColor: "#e21a37",
          secondaryColor: "#e21a37",
          teamId: "1610612737",
          tricode: "ATL",
          ttsName: "Atlanta Hawks"
        },
        ...
      ]
  """
  @spec teams_config() :: [%NbaEx.TeamConfig{}]
  def teams_config, do: TeamApi.teams_config()

  @doc """
  Returns team leaders for each statistic.

      iex> NbaEx.team_leaders("warriors")
      %NbaEx.TeamLeaders{
        apg: [%NbaEx.Leader{personId: "203110", value: "7.4"}],
        bpg: [%NbaEx.Leader{personId: "201142", value: "1.9"}],
        fgp: [%NbaEx.Leader{personId: "1628395", value: "0.657"}],
        ...
      }
  """
  @spec team_leaders(String.t()) ::
          %NbaEx.TeamLeaders{}
          | {:error, String.t()}
  def team_leaders(team_name) do
    TeamApi.team_leaders(team_name)
  rescue
    Poison.SyntaxError ->
      {:error, "There was an error getting team leaders for the given team: #{team_name}"}
  end

  @doc """
  Returns list of players of specified team.

      iex> NbaEx.team_roster("warriors")
      [
        %NbaEx.Player{
          personId: "1628395"
        },
        ...
      ]
  """
  @spec team_roster(String.t()) ::
          [%NbaEx.Player{}]
          | {:error, String.t()}
  def team_roster(team_name) do
    TeamApi.team_roster(team_name)
  rescue
    Poison.SyntaxError ->
      {:error, "There was an error getting team roster for the given team: #{team_name}"}
  end

  @doc """
  Returns the schedule for a specified team.

      iex> NbaEx.team_schedule("warriors")
      [
        %NbaEx.Game{
          arena: %NbaEx.Arena{city: nil, country: nil, name: nil, stateAbbr: nil},
          clock: "",
          endTimeUTC: "",
          gameId: "0011700001",
          ...
        },
        ...
      ]
  """
  @spec team_schedule(String.t()) ::
          [%NbaEx.Game{}]
          | {:error, String.t()}
  def team_schedule(team_name) do
    TeamApi.team_schedule(team_name)
  rescue
    Poison.SyntaxError ->
      {:error, "There was an error getting team schedule for the given team: #{team_name}"}
  end
end
