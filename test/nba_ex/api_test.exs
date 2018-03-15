defmodule ApiTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.Api

  setup_all do
    HTTPoison.start
  end

  test "play_by_play/3" do
    use_cassette "play_by_play" do
      pbp                  = Api.play_by_play("20180314", "0021701017", 3)
      first_play_of_period = pbp.plays |> List.first

      assert first_play_of_period.clock      == "12:00"
      assert first_play_of_period.vTeamScore == "52"
    end
  end
end
