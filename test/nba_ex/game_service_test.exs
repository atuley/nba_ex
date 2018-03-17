defmodule GameServiceTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.GameService

  setup_all do
    HTTPoison.start()
  end

  test "get_boxscore/2" do
    use_cassette "boxscore" do
      actual_boxscore   = GameService.get_boxscore("20180309", "0021700977")
      first_player_stat = actual_boxscore.player_stats |> List.first()

      assert actual_boxscore.game.gameId                     == "0021700977"
      assert actual_boxscore.away_team_stats.fastBreakPoints == "8"
      assert actual_boxscore.home_team_stats.totals.assists  == "22"
      assert first_player_stat.points                        == "6"
    end
  end

  test "play_by_play/3" do
    use_cassette "play_by_play" do
      pbp                  = GameService.play_by_play("20180314", "0021701017", 3)
      first_play_of_period = pbp.plays |> List.first()

      assert first_play_of_period.clock      == "12:00"
      assert first_play_of_period.vTeamScore == "52"
    end
  end

  test "get_scoreboard/1" do
    use_cassette "20180308_scoreboard" do
      scoreboard   = GameService.get_scoreboard("20180308")
      actual_game  = scoreboard.games |> List.first()
      num_of_games = scoreboard.games |> Kernel.length()

      assert num_of_games              == 5
      assert actual_game.hTeam.triCode == "CHA"
      assert actual_game.hTeam.score   == "111"
      assert actual_game.vTeam.triCode == "BKN"
      assert actual_game.vTeam.score   == "125"
    end
  end
end
