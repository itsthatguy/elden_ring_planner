defmodule EldenRingPlanner.Repo.Migrations.CreateBuild do
  use Ecto.Migration

  def change do
    create table(:build) do
      add :name, :string
      add :level, :integer
      add :vigor, :integer
      add :mind, :integer
      add :endurance, :integer
      add :strength, :integer
      add :dexterity, :integer
      add :intelligence, :integer
      add :faith, :integer
      add :arcane, :integer

      timestamps()
    end
  end
end
