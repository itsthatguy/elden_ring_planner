defmodule EldenRingPlanner.BuildsTest do
  use EldenRingPlanner.DataCase

  alias EldenRingPlanner.Builds

  describe "build" do
    alias EldenRingPlanner.Builds.Build

    import EldenRingPlanner.BuildsFixtures

    @invalid_attrs %{name: nil}

    test "list_build/0 returns all build" do
      build = build_fixture()
      assert Builds.list_build() == [build]
    end

    test "get_build!/1 returns the build with given id" do
      build = build_fixture()
      assert Builds.get_build!(build.id) == build
    end

    test "create_build/1 with valid data creates a build" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Build{} = build} = Builds.create_build(valid_attrs)
      assert build.name == "some name"
    end

    test "create_build/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Builds.create_build(@invalid_attrs)
    end

    test "update_build/2 with valid data updates the build" do
      build = build_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Build{} = build} = Builds.update_build(build, update_attrs)
      assert build.name == "some updated name"
    end

    test "update_build/2 with invalid data returns error changeset" do
      build = build_fixture()
      assert {:error, %Ecto.Changeset{}} = Builds.update_build(build, @invalid_attrs)
      assert build == Builds.get_build!(build.id)
    end

    test "delete_build/1 deletes the build" do
      build = build_fixture()
      assert {:ok, %Build{}} = Builds.delete_build(build)
      assert_raise Ecto.NoResultsError, fn -> Builds.get_build!(build.id) end
    end

    test "change_build/1 returns a build changeset" do
      build = build_fixture()
      assert %Ecto.Changeset{} = Builds.change_build(build)
    end
  end

  describe "build" do
    alias EldenRingPlanner.Builds.Build

    import EldenRingPlanner.BuildsFixtures

    @invalid_attrs %{arcane: nil, dexterity: nil, endurance: nil, faith: nil, intelligence: nil, level: nil, mind: nil, name: nil, strength: nil, vigor: nil}

    test "list_build/0 returns all build" do
      build = build_fixture()
      assert Builds.list_build() == [build]
    end

    test "get_build!/1 returns the build with given id" do
      build = build_fixture()
      assert Builds.get_build!(build.id) == build
    end

    test "create_build/1 with valid data creates a build" do
      valid_attrs = %{arcane: 42, dexterity: 42, endurance: 42, faith: 42, intelligence: 42, level: 42, mind: 42, name: "some name", strength: 42, vigor: 42}

      assert {:ok, %Build{} = build} = Builds.create_build(valid_attrs)
      assert build.arcane == 42
      assert build.dexterity == 42
      assert build.endurance == 42
      assert build.faith == 42
      assert build.intelligence == 42
      assert build.level == 42
      assert build.mind == 42
      assert build.name == "some name"
      assert build.strength == 42
      assert build.vigor == 42
    end

    test "create_build/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Builds.create_build(@invalid_attrs)
    end

    test "update_build/2 with valid data updates the build" do
      build = build_fixture()
      update_attrs = %{arcane: 43, dexterity: 43, endurance: 43, faith: 43, intelligence: 43, level: 43, mind: 43, name: "some updated name", strength: 43, vigor: 43}

      assert {:ok, %Build{} = build} = Builds.update_build(build, update_attrs)
      assert build.arcane == 43
      assert build.dexterity == 43
      assert build.endurance == 43
      assert build.faith == 43
      assert build.intelligence == 43
      assert build.level == 43
      assert build.mind == 43
      assert build.name == "some updated name"
      assert build.strength == 43
      assert build.vigor == 43
    end

    test "update_build/2 with invalid data returns error changeset" do
      build = build_fixture()
      assert {:error, %Ecto.Changeset{}} = Builds.update_build(build, @invalid_attrs)
      assert build == Builds.get_build!(build.id)
    end

    test "delete_build/1 deletes the build" do
      build = build_fixture()
      assert {:ok, %Build{}} = Builds.delete_build(build)
      assert_raise Ecto.NoResultsError, fn -> Builds.get_build!(build.id) end
    end

    test "change_build/1 returns a build changeset" do
      build = build_fixture()
      assert %Ecto.Changeset{} = Builds.change_build(build)
    end
  end
end
