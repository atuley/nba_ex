defmodule NbaEx.Player do
  alias NbaEx.Team

  defstruct firstName: "",
            lastName: "",
            personId: "",
            teamId: "",
            jersey: "",
            isActive: "",
            pos: "",
            heightFeet: "",
            heightInches: "",
            weightPounds: "",
            dateOfBirthUTC: "",
            teams: [%Team{}],
            nbaDebutYear: "",
            yearsPro: "",
            collegeName: "",
            country: ""
end
