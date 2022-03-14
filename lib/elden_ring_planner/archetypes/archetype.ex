defmodule EldenRingPlanner.Archetypes.Archetype do
  use Ecto.Schema
  import Ecto.Changeset

  schema "archetypes" do
    field :name, :string
    has_many :builds, EldenRingPlanner.Builds.Build

    timestamps()
  end

  @doc false
  def changeset(archetype, attrs) do
    archetype
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
