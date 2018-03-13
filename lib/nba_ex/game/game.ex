defmodule NbaEx.Game do
  alias NbaEx.{Arena, GamePeriod, TeamScore}

  defstruct [
    arena: %Arena{},
    gameId: "",
    startTimeUTC: "",
    endTimeUTC: "",
    clock: "",
    period: %GamePeriod{},
    vTeam: %TeamScore{},
    hTeam: %TeamScore{}
  ]
end
