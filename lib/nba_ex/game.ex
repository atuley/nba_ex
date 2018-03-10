defmodule NbaEx.Game do
  alias NbaEx.{Arena, GamePeriod, TeamScore}

  defstruct [
    arena: %Arena{},
    gameId: "",
    startTimeUTC: "",
    clock: "",
    period: %GamePeriod{},
    vTeam: %TeamScore{},
    hTeam: %TeamScore{},
  ]
end
