defmodule PlayersTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.Players

  setup_all do
    HTTPoison.start
  end

  test "all/0" do
    use_cassette "players" do
      players         = Players.all()
      actual_player   = players |> List.first
      num_of_players  = players |> Kernel.length

      assert num_of_players           == 599
      assert actual_player.personId   == "203518"
      assert actual_player.firstName  == "Alex"
      assert actual_player.lastName   == "Abrines"
    end
  end
end
