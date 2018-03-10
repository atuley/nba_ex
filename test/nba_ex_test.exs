defmodule NbaExTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    HTTPoison.start
  end

  test "scoreboard_for/1" do
    use_cassette "20180308_scoreboard" do
      scoreboard = NbaEx.scoreboard_for("20180308")
      
      assert scoreboard.games |> Kernel.length == 5
    end
  end
end
