defmodule NbaEx do
  alias NbaEx.{Players, Scoreboard, Teams}

  def players do
    Players.all()
  end

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
