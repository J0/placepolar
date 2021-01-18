defmodule PlacepolarWeb.UserController do
  use PlacepolarWeb, :controller
  alias Placepolar.Accounts

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.html", users: users)
  end
end
