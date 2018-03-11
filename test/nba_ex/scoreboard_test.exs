defmodule ScoreboardTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.Scoreboard

  setup_all do
    HTTPoison.start
  end

  test "get_scoreboard/1" do
    use_cassette "20180308_scoreboard" do
      scoreboard = Scoreboard.get_scoreboard("20180308")

      actual_game   = scoreboard.games |> List.first
      expected_game = %NbaEx.Game{
              arena: %NbaEx.Arena{
                city: "Charlotte",
                country: "USA",
                name: "Spectrum Center",
                stateAbbr: "NC"
              },
              clock: "",
              gameId: "0021700972",
              hTeam: %NbaEx.TeamScore{
                score: "111",
                teamId: "1610612766",
                triCode: "CHA"
              },
              period: %NbaEx.GamePeriod{current: 4},
              startTimeUTC: "2018-03-09T00:00:00.000Z",
              vTeam: %NbaEx.TeamScore{
                score: "125",
                teamId: "1610612751",
                triCode: "BKN"
              }
            }

      assert scoreboard.games |> Kernel.length == 5
      assert actual_game.hTeam.triCode  == expected_game.hTeam.triCode
      assert actual_game.hTeam.score    == expected_game.hTeam.score
      assert actual_game.vTeam.triCode  == expected_game.vTeam.triCode
      assert actual_game.vTeam.score    == expected_game.vTeam.score
    end
  end
end
