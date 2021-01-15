defmodule PlacepolarWeb.PageController do
  use PlacepolarWeb, :controller
  import Mogrify

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"width" => width, "height" => height}) do
    # img =
    #   Mogrify.open("")
    #   |> resize("#{width}x#{height}")
    #   |> save()

    render(
      conn,
      "photo.html",
      %{height: height, width: width, number: 2}
    )
  end
end
