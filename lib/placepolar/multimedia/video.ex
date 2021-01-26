defmodule Placepolar.Multimedia.Video do
  use Ecto.Schema
  import Ecto.Changeset
  alias Placepolar.Accounts

  schema "videos" do
    field :url, :string
    field :description, :string
    field :title, :string
    belongs_to :user, Placepolar.Accounts.User
    belongs_to :category, Placepolar.Multimedia.Category

    timestamps()
  end

  @doc false
  def changeset(video, attrs) do
    video
    |> cast(attrs, [:url, :title, :description])
    |> validate_required([:url, :title, :description])
    |> assoc_constraint(:category)
  end

  # def create_video(%Accounts.User{} = user, attrs \\ %{}) do
  #   %Video{}
  #   |> Video.changeset(attrs)
  #   |> Ecto.changeset().put_assoc(:user, user)
  #   |> Repo.insert()
  # end
end
