defmodule PlayersTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.Players

  setup_all do
    HTTPoison.start
  end

  test "all/0" do
    use_cassette "players" do
      players = Players.all()

      actual_player   = players |> List.first
      expected_player = %NbaEx.Player{
                          collegeName: "",
                          country: "Spain",
                          dateOfBirthUTC: "1993-08-01",
                          firstName: "Alex",
                          heightFeet: "6",
                          heightInches: "6",
                          isActive: true,
                          jersey: "8",
                          lastName: "Abrines",
                          nbaDebutYear: "2016",
                          personId: "203518",
                          pos: "G",
                          teamId: "1610612760",
                          teams: [
                            %NbaEx.Team{
                              city: nil,
                              confName: nil,
                              divName: nil,
                              fullName: nil,
                              isNBAFranchise: nil,
                              nickname: nil,
                              teamId: "1610612760",
                              tricode: nil
                            }
                          ],
                          weightPounds: "190",
                          yearsPro: "1"
                        }

      assert players |> Kernel.length == 599
      assert actual_player.personId   == expected_player.personId
      assert actual_player.firstName  == expected_player.firstName
      assert actual_player.lastName   == expected_player.lastName
    end
  end
end
