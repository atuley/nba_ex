defmodule PlayerGameLogTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.Player

  setup_all do
    HTTPoison.start
  end

  test "game_log_for/1" do
    use_cassette "player_game_log" do
      player_game_log = Player.game_log("203463")
      number_of_games = player_game_log |> Kernel.length
      first_game      = player_game_log |> List.first

      assert number_of_games           == 3
      assert first_game.gameId         == "0021701002"
      assert first_game.hTeam.score    == "103"
      assert first_game.vTeam.isWinner == true
      assert first_game.stats.points   == "16"
    end
  end
end
