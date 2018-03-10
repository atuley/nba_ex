defmodule NbaEx.Game do
  defstruct [
    gameId: "",
    startTimeUTC: "",
    clock: "",
    arena: %{},
    period: %{},
    vTeam: %{},
    hTeam: %{},
  ]
end
