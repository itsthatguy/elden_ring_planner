defmodule EldenRingPlanner.ArchetypesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EldenRingPlanner.Archetypes` context.
  """

  @doc """
  Generate a archetype.
  """
  def archetype_fixture(attrs \\ %{}) do
    {:ok, archetype} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> EldenRingPlanner.Archetypes.create_archetype()

    archetype
  end
end
