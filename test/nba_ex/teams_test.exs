defmodule TeamsTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.Teams

  setup_all do
    HTTPoison.start
  end

  test "all/0" do
    use_cassette "teams" do
      teams         = Teams.all()
      actual_team   = teams |> List.first

      assert teams |> Kernel.length == 30
      assert actual_team.teamId     == "1610612737"
      assert actual_team.fullName   == "Atlanta Hawks"
    end
  end
end
