defmodule EldenRingPlanner.Builds.Build do
  use Ecto.Schema
  import Ecto.Changeset

  schema "builds" do
    field :arcane, :integer
    field :dexterity, :integer
    field :endurance, :integer
    field :faith, :integer
    field :intelligence, :integer
    field :level, :integer
    field :mind, :integer
    field :name, :string
    field :strength, :integer
    field :vigor, :integer
    belongs_to :archetype, EldenRingPlanner.Archetypes.Archetype

    timestamps()
  end

  @doc false
  def changeset(build, attrs) do
    build
    |> cast(attrs, [
      :name,
      :level,
      :vigor,
      :mind,
      :endurance,
      :strength,
      :dexterity,
      :intelligence,
      :faith,
      :arcane
    ])
    |> validate_required([
      :name,
      :level,
      :vigor,
      :mind,
      :endurance,
      :strength,
      :dexterity,
      :intelligence,
      :faith,
      :arcane
    ])
  end
end
