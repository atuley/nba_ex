defmodule PlayerGameLogTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias NbaEx.Players

  setup_all do
    HTTPoison.start
  end

  test "all/0" do
    # use_cassette "players" do

    # end
  end
end
