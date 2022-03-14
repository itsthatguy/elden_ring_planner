defmodule EldenRingPlanner.Repo.Migrations.CreateArchetypes do
  use Ecto.Migration

  def change do
    create table(:archetypes) do
      add :name, :string

      timestamps()
    end
  end
end
