defmodule BoxscoreTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.Boxscore

  setup_all do
    HTTPoison.start
  end

  test "get_boxscore/2" do
    use_cassette "boxscore" do
      actual_boxscore   = Boxscore.get_boxscore("20180309","0021700977")
      first_player_stat = actual_boxscore.player_stats |> List.first

      assert actual_boxscore.game.gameId                     == "0021700977"
      assert actual_boxscore.away_team_stats.fastBreakPoints == "8"
      assert actual_boxscore.home_team_stats.totals.assists  == "22"
      assert first_player_stat.points                        == "6"
    end
  end
end
