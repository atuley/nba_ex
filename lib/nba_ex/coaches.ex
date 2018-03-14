defmodule NbaEx.Coaches do
  alias NbaEx.{Constants, Endpoints, Coach}

  def all do
    HTTPoison.get!("#{Constants.base_url}/#{Constants.base_version}/#{Constants.year}/#{Endpoints.coaches}").body
    |> Poison.decode!(as: %{"league" => %{"standard" => [%Coach{}]}})
    |> grab_coaches
  end

  defp grab_coaches(%{"league" => %{"standard" => coaches}}), do: coaches
end
