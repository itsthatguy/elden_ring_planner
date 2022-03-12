defmodule EldenRingPlanner.Repo do
  use Ecto.Repo,
    otp_app: :elden_ring_planner,
    adapter: Ecto.Adapters.Postgres
end
