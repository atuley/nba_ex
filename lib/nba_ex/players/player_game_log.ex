defmodule NbaEx.PlayerGameLog do
  alias NbaEx.{PlayerStat, TeamScore}

  defstruct gameId: "",
            gameDateUTC: "",
            gameUrlCode: "",
            isHomeGame: nil,
            hTeam: %TeamScore{},
            vTeam: %TeamScore{},
            stats: %PlayerStat{}
end
