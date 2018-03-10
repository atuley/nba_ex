defmodule ScoreboardTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.Scoreboard

  setup_all do
    HTTPoison.start
  end

  test "get_scoreboard/1" do
    use_cassette "20180308_scoreboard" do
      scoreboard = Scoreboard.get_scoreboard("20180308")

      assert scoreboard.games |> Kernel.length == 5
    end
  end
end
