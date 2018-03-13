defmodule NbaEx.PlayerStat do
  defstruct [
    :personId,
    :teamId,
    :isOnCourt,
    :points,
    :pos,
    :min,
    :fgm,
    :fga,
    :fgp,
    :ftm,
    :fta,
    :ftp,
    :tpm,
    :tpa,
    :tpp,
    :offReb,
    :defReb,
    :totReb,
    :assists,
    :pFouls,
    :steals,
    :turnovers,
    :blocks,
    :plusMinus,
    :dnp
  ]
end