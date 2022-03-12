defmodule EldenRingPlanner.ArchetypesTest do
  use EldenRingPlanner.DataCase

  alias EldenRingPlanner.Archetypes

  describe "archetype" do
    alias EldenRingPlanner.Archetypes.Archetype

    import EldenRingPlanner.ArchetypesFixtures

    @invalid_attrs %{name: nil}

    test "list_archetype/0 returns all archetype" do
      archetype = archetype_fixture()
      assert Archetypes.list_archetype() == [archetype]
    end

    test "get_archetype!/1 returns the archetype with given id" do
      archetype = archetype_fixture()
      assert Archetypes.get_archetype!(archetype.id) == archetype
    end

    test "create_archetype/1 with valid data creates a archetype" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Archetype{} = archetype} = Archetypes.create_archetype(valid_attrs)
      assert archetype.name == "some name"
    end

    test "create_archetype/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Archetypes.create_archetype(@invalid_attrs)
    end

    test "update_archetype/2 with valid data updates the archetype" do
      archetype = archetype_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Archetype{} = archetype} = Archetypes.update_archetype(archetype, update_attrs)
      assert archetype.name == "some updated name"
    end

    test "update_archetype/2 with invalid data returns error changeset" do
      archetype = archetype_fixture()
      assert {:error, %Ecto.Changeset{}} = Archetypes.update_archetype(archetype, @invalid_attrs)
      assert archetype == Archetypes.get_archetype!(archetype.id)
    end

    test "delete_archetype/1 deletes the archetype" do
      archetype = archetype_fixture()
      assert {:ok, %Archetype{}} = Archetypes.delete_archetype(archetype)
      assert_raise Ecto.NoResultsError, fn -> Archetypes.get_archetype!(archetype.id) end
    end

    test "change_archetype/1 returns a archetype changeset" do
      archetype = archetype_fixture()
      assert %Ecto.Changeset{} = Archetypes.change_archetype(archetype)
    end
  end
end
