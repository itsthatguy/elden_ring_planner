defmodule EldenRingPlanner.Repo.Migrations.BuildBelongsToArchetype do
  use Ecto.Migration

  def change do
    alter table(:builds) do
      add :archetype_id, references(:archetypes)
    end
  end
end
