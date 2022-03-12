defmodule EldenRingPlanner.BuildsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EldenRingPlanner.Builds` context.
  """

  @doc """
  Generate a build.
  """
  def build_fixture(attrs \\ %{}) do
    {:ok, build} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> EldenRingPlanner.Builds.create_build()

    build
  end

  @doc """
  Generate a build.
  """
  def build_fixture(attrs \\ %{}) do
    {:ok, build} =
      attrs
      |> Enum.into(%{
        arcane: 42,
        dexterity: 42,
        endurance: 42,
        faith: 42,
        intelligence: 42,
        level: 42,
        mind: 42,
        name: "some name",
        strength: 42,
        vigor: 42
      })
      |> EldenRingPlanner.Builds.create_build()

    build
  end
end
