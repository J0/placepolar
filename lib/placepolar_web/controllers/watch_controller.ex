defmodule PlacepolarWeb.WatchController do
  use PlacepolarWeb, :controller
  alias Placepolar.Multimedia

  def show(conn, %{"id" => id}) do
    video = Multimedia.get_video!(id)
    render(conn, "show.html", video: video)
  end
end
