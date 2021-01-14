defmodule PlacepolarWeb.PageController do
  use PlacepolarWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"width" => width, "height" => height}) do
    render(conn, "photo.html")
  end
end
