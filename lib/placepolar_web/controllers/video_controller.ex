defmodule PlacepolarWeb.VideoController do
  use PlacepolarWeb, :controller

  alias Placepolar.Multimedia
  alias Placepolar.Multimedia.Video
  plug :load_categories when action in [:new, :create, :edit, :delete, :update]

  defp load_categories(conn, _) do
    assign(conn, :categories, Multimedia.list_alphabetical_categories())
  end

  def index(conn, _params, current_user) do
    videos = Multimedia.list_user_videos(current_user)
    render(conn, "index.html", videos: videos)
  end

  def new(conn, _params) do
    changeset = Multimedia.change_video(%Video{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"video" => video_params}) do
    case Multimedia.create_video(video_params) do
      {:ok, video} ->
        conn
        |> put_flash(:info, "Video created successfully.")
        |> redirect(to: Routes.video_path(conn, :show, video))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}, current_user) do
    video = Multimedia.get_user_video!(current_user, id)
    render(conn, "show.html", video: video)
  end

  def edit(conn, %{"id" => id}, current_user) do
    video = Multimedia.get_video!(current_user, id)
    changeset = Multimedia.change_video(video)
    render(conn, "edit.html", video: video, changeset: changeset)
  end

  def update(conn, %{"id" => id, "video" => video_params}, current_user) do
    video = Multimedia.get_video!(current_user, id)

    case Multimedia.update_video(video, video_params) do
      {:ok, video} ->
        conn
        |> put_flash(:info, "Video updated successfully.")
        |> redirect(to: Routes.video_path(conn, :show, video))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", video: video, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}, current_user) do
    video = Multimedia.get_video!(current_user, id)
    {:ok, _video} = Multimedia.delete_video(video)

    conn
    |> put_flash(:info, "Video deleted successfully.")
    |> redirect(to: Routes.video_path(conn, :index))
  end
end