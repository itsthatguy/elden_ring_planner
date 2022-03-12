defmodule EldenRingPlanner.Repo.Migrations.CreateArchetype do
  use Ecto.Migration

  def change do
    create table(:archetype) do
      add :name, :string

      timestamps()
    end
  end
end
