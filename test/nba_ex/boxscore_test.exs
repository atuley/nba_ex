defmodule BoxscoreTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.Boxscore

  setup_all do
    HTTPoison.start
  end

  test "get_boxscore/2" do
    use_cassette "boxscore" do
      actual_boxscore = Boxscore.get_boxscore("20180309","0021700977")

      assert actual_boxscore.gameId == "0021700977"
    end
  end
end
