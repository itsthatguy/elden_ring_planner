defmodule EldenRingPlanner.StatsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EldenRingPlanner.Stats` context.
  """

  @doc """
  Generate a stat.
  """
  def stat_fixture(attrs \\ %{}) do
    {:ok, stat} =
      attrs
      |> Enum.into(%{
        name: "some name",
        value: 42
      })
      |> EldenRingPlanner.Stats.create_stat()

    stat
  end
end
