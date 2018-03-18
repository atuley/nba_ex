defmodule NbaExTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    HTTPoison.start()
  end

  test "boxscore/2" do
    use_cassette "boxscore" do
      boxscore = NbaEx.boxscore("20180309", "0021700977")

      assert boxscore.game.gameId == "0021700977"
    end
  end

  test "coaches/0" do
    use_cassette "coaches" do
      coaches = NbaEx.coaches()

      assert coaches |> Kernel.length() == 213
    end
  end

  test "play_by_play/3" do
    use_cassette "play_by_play" do
      pbp = NbaEx.play_by_play("20180314", "0021701017", 3)

      assert pbp.plays |> Kernel.length() == 101
    end
  end

  test "player_game_log/1" do
    use_cassette "player_game_log" do
      player_game_log = NbaEx.player_game_log("203463")

      assert player_game_log |> Kernel.length() == 3
    end
  end

  test "players/0" do
    use_cassette "players" do
      players = NbaEx.players()

      assert players |> Kernel.length() == 599
    end
  end

  test "scoreboard_for/1" do
    use_cassette "20180308_scoreboard" do
      scoreboard = NbaEx.scoreboard_for("20180308")

      assert scoreboard.games |> Kernel.length() == 5
    end
  end

  test "teams/0" do
    use_cassette "teams" do
      teams = NbaEx.teams()

      assert teams |> Kernel.length() == 30
    end
  end

  test "teams_config/0" do
    use_cassette "teams_config" do
      teams_config = NbaEx.teams_config()

      assert teams_config |> Kernel.length() == 41
    end
  end

  test "team_leaders/1" do
    use_cassette "team_leaders" do
      team_leaders = NbaEx.team_leaders("warriors")

      assert team_leaders != nil
    end
  end

  test "team_roster" do
    use_cassette "team_roster" do
      roster = NbaEx.team_roster("warriors")

      assert roster |> Kernel.length() == 17
    end
  end

  test "team_schedule/1" do
    use_cassette "team_schedule" do
      team_schedule = NbaEx.team_schedule("warriors")

      assert team_schedule |> Kernel.length() == 86
    end
  end
end
