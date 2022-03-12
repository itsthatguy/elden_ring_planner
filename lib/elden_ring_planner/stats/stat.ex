defmodule EldenRingPlanner.Stats.Stat do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stats" do
    field :name, :string
    field :value, :integer

    timestamps()
  end

  @doc false
  def changeset(stat, attrs) do
    stat
    |> cast(attrs, [:name, :value])
    |> validate_required([:name, :value])
  end
end
