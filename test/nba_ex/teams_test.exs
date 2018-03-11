defmodule TeamsTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.Teams

  setup_all do
    HTTPoison.start
  end

  test "all/0" do
    use_cassette "teams" do
      teams = Teams.all()

      actual_team   = teams |> List.first
      expected_team = %NbaEx.Team{
                        city: "Atlanta",
                        confName: "East",
                        divName: "Southeast",
                        fullName: "Atlanta Hawks",
                        isNBAFranchise: true,
                        nickname: "Hawks",
                        teamId: "1610612737",
                        tricode: "ATL"
                      }

      assert teams |> Kernel.length == 30
      assert actual_team.teamId     == expected_team.teamId
      assert actual_team.fullName   == expected_team.fullName
    end
  end
end
