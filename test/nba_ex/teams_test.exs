defmodule TeamsTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.Teams

  setup_all do
    HTTPoison.start
  end

  test "all/0" do
    use_cassette "teams" do
      teams = Teams.all()

      assert teams |> Kernel.length == 30
    end
  end
end
