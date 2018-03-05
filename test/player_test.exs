defmodule PlayerTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.Player

  setup_all do
    HTTPoison.start
  end

  test "basic_stats" do
    use_cassette "stephen_curry_stats" do
      assert Player.basic_stats == %Player{name: "Stephen Curry", points_per_game: 26.7}
    end
  end
end
