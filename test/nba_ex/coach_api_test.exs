defmodule CoachApiTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.CoachApi

  setup_all do
    HTTPoison.start()
  end

  test "all/0" do
    use_cassette "coaches" do
      coaches           = CoachApi.all()
      number_of_coaches = coaches |> Kernel.length()
      first_coach       = coaches |> List.first()

      assert number_of_coaches       == 214
      assert first_coach["college"]     == "Oklahoma"
      assert first_coach["personId"]    == "1337"
    end
  end
end
