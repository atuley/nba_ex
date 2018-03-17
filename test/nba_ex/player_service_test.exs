defmodule PlayerServiceTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.PlayerService

  setup_all do
    HTTPoison.start()
  end

  test "all/0" do
    use_cassette "players" do
      players        = PlayerService.all()
      actual_player  = players |> List.first()
      num_of_players = players |> Kernel.length()

      assert num_of_players          == 599
      assert actual_player.personId  == "203518"
      assert actual_player.firstName == "Alex"
      assert actual_player.lastName  == "Abrines"
    end
  end

  test "game_log_for/1" do
    use_cassette "player_game_log" do
      player_game_log = PlayerService.game_log("203463")
      number_of_games = player_game_log |> Kernel.length()
      first_game      = player_game_log |> List.first()

      assert number_of_games           == 3
      assert first_game.gameId         == "0021701002"
      assert first_game.hTeam.score    == "103"
      assert first_game.vTeam.isWinner == true
      assert first_game.stats.points   == "16"
    end
  end
end
