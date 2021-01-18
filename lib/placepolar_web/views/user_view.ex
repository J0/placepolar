defmodule PlacepolarWeb.UserView do
  use PlacepolarWeb, :view
  alias Placepolar.Accounts

  def first_name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
