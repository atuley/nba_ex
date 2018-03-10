defmodule NbaEx.Helpers do
  def current_date do
    Date.utc_today
    |> Date.to_iso8601(:basic)
  end
end
