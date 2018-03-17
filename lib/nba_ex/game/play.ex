defmodule NbaEx.Play do
  defstruct [
    :clock,
    :eventMsgType,
    :description,
    :personId,
    :teamId,
    :vTeamScore,
    :hTeamScore,
    :isScoreChange,
    :isVideoAvailable
  ]
end
