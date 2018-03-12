defmodule ScoreboardTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.Scoreboard

  setup_all do
    HTTPoison.start
  end

  test "get_scoreboard/1" do
    use_cassette "20180308_scoreboard" do
      scoreboard    = Scoreboard.get_scoreboard("20180308")
      actual_game   = scoreboard.games |> List.first
      num_of_games  = scoreboard.games |> Kernel.length


      assert num_of_games               == 5
      assert actual_game.hTeam.triCode  == "CHA"
      assert actual_game.hTeam.score    == "111"
      assert actual_game.vTeam.triCode  == "BKN"
      assert actual_game.vTeam.score    == "125"
    end
  end
end
