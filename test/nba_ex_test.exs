defmodule NbaExTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    HTTPoison.start
  end

  test "players/0" do
    use_cassette "players" do
      players = NbaEx.players()

      assert players |> Kernel.length == 599
    end
  end

  test "scoreboard_for/1" do
    use_cassette "20180308_scoreboard" do
      scoreboard = NbaEx.scoreboard_for("20180308")

      assert scoreboard.games |> Kernel.length == 5
    end
  end

  test "teams/0" do
    use_cassette "teams" do
      teams = NbaEx.teams()

      assert teams |> Kernel.length == 30
    end
  end
end
