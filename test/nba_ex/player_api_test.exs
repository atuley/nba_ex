defmodule PlayerApiTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.PlayerApi

  setup_all do
    HTTPoison.start()
  end

  test "all/0" do
    use_cassette "players" do
      players        = PlayerApi.all()
      actual_player  = players |> List.first()
      num_of_players = players |> Kernel.length()

      assert num_of_players          == 707
      assert actual_player["personId"]  == "1629824"
      assert actual_player["firstName"] == "Jalen"
      assert actual_player["lastName"]  == "Adams"
    end
  end

  test "game_log_for/1" do
    use_cassette "player_game_log" do
      player_game_log = PlayerApi.game_log("203463")
      number_of_games = player_game_log |> Kernel.length()
      first_game      = player_game_log |> List.first()

      assert number_of_games           == 3
      assert first_game["gameId"]         == "0011900030"
      assert first_game["hTeam"]["score"]    == "118"
      assert first_game["vTeam"]["isWinner"] == false
      assert first_game["stats"]["points"]   == "3"
    end
  end
end
