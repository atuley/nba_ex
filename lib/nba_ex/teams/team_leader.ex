defmodule NbaEx.TeamLeaders do
  alias NbaEx.Leader

  defstruct [
    seasonStageId: 0,
    ppg: [%Leader{}],
    trpg: [%Leader{}],
    apg: [%Leader{}],
    fgp: [%Leader{}],
    tpp: [%Leader{}],
    ftp: [%Leader{}],
    bpg: [%Leader{}],
    spg: [%Leader{}],
    tpg: [%Leader{}],
    pfpg: [%Leader{}]
  ]
end
