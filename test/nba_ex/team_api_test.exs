defmodule TeamApiTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.TeamApi

  setup_all do
    HTTPoison.start()
  end

  test "all/0" do
    use_cassette "teams" do
      teams       = TeamApi.all()
      actual_team = teams |> List.first()

      assert teams |> Kernel.length() == 30
      assert actual_team["teamId"]       == "1610612737"
      assert actual_team["fullName"]     == "Atlanta Hawks"
    end
  end

  test "teams_config/0" do
    use_cassette "teams_config" do
      teams_config      = TeamApi.teams_config()
      first_team_config = teams_config |> List.first()

      assert first_team_config["teamId"]  == "15019"
      assert first_team_config["tricode"] == "ADL"
    end
  end

  test "team_leaders/1" do
    use_cassette "team_leaders" do
      team_leaders = TeamApi.team_leaders("warriors")
      ppg_leader   = team_leaders["ppg"] |> List.first()

      assert ppg_leader["personId"] == "201142"
      assert ppg_leader["value"]    == "32.3"
    end
  end

  test "team_roster/1" do
    use_cassette "team_roster" do
      roster       = TeamApi.team_roster("warriors")
      first_player = roster |> List.first()

      assert first_player["personId"] == "1628395"
    end
  end

  test "team_schedule/1" do
    use_cassette "team_schedule" do
      team_schedule      = TeamApi.team_schedule("warriors")
      length_of_schedule = team_schedule |> Kernel.length()
      first_game         = team_schedule |> List.first()

      assert length_of_schedule      == 109
      assert first_game["startTimeUTC"] == "2018-09-30T00:30:00.000Z"
      assert first_game["vTeam"]["score"]  == "114"
    end
  end
end
