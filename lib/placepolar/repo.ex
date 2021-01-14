defmodule Placepolar.Repo do
  use Ecto.Repo,
    otp_app: :placepolar,
    adapter: Ecto.Adapters.Postgres
end
