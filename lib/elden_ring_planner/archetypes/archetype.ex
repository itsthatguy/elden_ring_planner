defmodule EldenRingPlanner.Archetypes.Archetype do
  use Ecto.Schema
  import Ecto.Changeset

  schema "archetype" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(archetype, attrs) do
    archetype
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
