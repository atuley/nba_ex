defmodule PlayersTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.Players

  setup_all do
    HTTPoison.start
  end

  test "find_player_id/2" do
    use_cassette "all_players" do
      assert Players.find_player_id("Curry", "Stephen") == 201939
    end
  end
end
