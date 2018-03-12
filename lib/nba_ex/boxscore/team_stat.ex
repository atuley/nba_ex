defmodule NbaEx.TeamStat do
  alias NbaEx.Totals

  defstruct [
    fastBreakPoints: "",
    pointsInPaint: "",
    biggestLead: "",
    secondChancePoints: "",
    pointsOffTurnovers: "",
    longestRun: "",
    totals: %Totals{}
    # leaders: %{}
  ]
end
