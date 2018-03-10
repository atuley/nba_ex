defmodule NbaEx do
  alias NbaEx.{Scoreboard, Teams}

  # UTC date
  def scoreboard do
    Scoreboard.get_current_scoreboard()
  end

  def scoreboard_for(date) do
    Scoreboard.get_scoreboard(date)
  end

  def teams do
    Teams.all()
  end
end
