defmodule EldenRingPlannerWeb.BuildControllerTest do
  use EldenRingPlannerWeb.ConnCase

  import EldenRingPlanner.BuildsFixtures

  @create_attrs %{arcane: 42, dexterity: 42, endurance: 42, faith: 42, intelligence: 42, level: 42, mind: 42, name: "some name", strength: 42, vigor: 42}
  @update_attrs %{arcane: 43, dexterity: 43, endurance: 43, faith: 43, intelligence: 43, level: 43, mind: 43, name: "some updated name", strength: 43, vigor: 43}
  @invalid_attrs %{arcane: nil, dexterity: nil, endurance: nil, faith: nil, intelligence: nil, level: nil, mind: nil, name: nil, strength: nil, vigor: nil}

  describe "index" do
    test "lists all build", %{conn: conn} do
      conn = get(conn, Routes.build_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Build"
    end
  end

  describe "new build" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.build_path(conn, :new))
      assert html_response(conn, 200) =~ "New Build"
    end
  end

  describe "create build" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.build_path(conn, :create), build: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.build_path(conn, :show, id)

      conn = get(conn, Routes.build_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Build"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.build_path(conn, :create), build: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Build"
    end
  end

  describe "edit build" do
    setup [:create_build]

    test "renders form for editing chosen build", %{conn: conn, build: build} do
      conn = get(conn, Routes.build_path(conn, :edit, build))
      assert html_response(conn, 200) =~ "Edit Build"
    end
  end

  describe "update build" do
    setup [:create_build]

    test "redirects when data is valid", %{conn: conn, build: build} do
      conn = put(conn, Routes.build_path(conn, :update, build), build: @update_attrs)
      assert redirected_to(conn) == Routes.build_path(conn, :show, build)

      conn = get(conn, Routes.build_path(conn, :show, build))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, build: build} do
      conn = put(conn, Routes.build_path(conn, :update, build), build: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Build"
    end
  end

  describe "delete build" do
    setup [:create_build]

    test "deletes chosen build", %{conn: conn, build: build} do
      conn = delete(conn, Routes.build_path(conn, :delete, build))
      assert redirected_to(conn) == Routes.build_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.build_path(conn, :show, build))
      end
    end
  end

  defp create_build(_) do
    build = build_fixture()
    %{build: build}
  end
end
