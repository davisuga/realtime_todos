defmodule RealtimeTodos.Repo do
  use Ecto.Repo,
    otp_app: :realtime_todos,
    adapter: Ecto.Adapters.Postgres
end
