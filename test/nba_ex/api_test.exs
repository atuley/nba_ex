defmodule ApiTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.Api

  setup_all do
    HTTPoison.start
  end

  test "play_by_play/3" do
    use_cassette "play_by_play" do
      pbp                  = Api.play_by_play("20180314", "0021701017", 3)
      first_play_of_period = pbp.plays |> List.first

      assert first_play_of_period.clock      == "12:00"
      assert first_play_of_period.vTeamScore == "52"
    end
  end

  test "team_roster/1" do
    use_cassette "team_roster" do
      roster = Api.team_roster("warriors")
      first_player = roster |> List.first

      assert first_player.personId == "1628395"
    end
  end

  test "team_schedule/1" do
    use_cassette "team_schedule" do
      team_schedule      = Api.team_schedule("warriors")
      length_of_schedule = team_schedule |> Kernel.length
      first_game         = team_schedule |> List.first

      assert length_of_schedule          == 86
      assert first_game.startTimeUTC     == "2017-10-01T00:30:00.000Z"
      assert first_game.vTeam.score      == "108"
    end
  end
end
