defmodule NbaEx.Players do
  alias NbaEx.{Constants, Endpoints, Player}

  def all do
    HTTPoison.get!("#{Constants.base_url}/#{Constants.base_version}/#{Constants.year}/#{Endpoints.players}").body
    |> Poison.decode!(as: %{"league" => %{"standard" => [%Player{}]}})
    |> grab_players
  end

  defp grab_players(%{"league" => %{"standard" => players}}), do: players
end
