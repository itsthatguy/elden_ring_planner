defmodule EldenRingPlannerWeb.ArchetypeControllerTest do
  use EldenRingPlannerWeb.ConnCase

  import EldenRingPlanner.ArchetypesFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all archetype", %{conn: conn} do
      conn = get(conn, Routes.archetype_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Archetype"
    end
  end

  describe "new archetype" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.archetype_path(conn, :new))
      assert html_response(conn, 200) =~ "New Archetype"
    end
  end

  describe "create archetype" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.archetype_path(conn, :create), archetype: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.archetype_path(conn, :show, id)

      conn = get(conn, Routes.archetype_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Archetype"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.archetype_path(conn, :create), archetype: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Archetype"
    end
  end

  describe "edit archetype" do
    setup [:create_archetype]

    test "renders form for editing chosen archetype", %{conn: conn, archetype: archetype} do
      conn = get(conn, Routes.archetype_path(conn, :edit, archetype))
      assert html_response(conn, 200) =~ "Edit Archetype"
    end
  end

  describe "update archetype" do
    setup [:create_archetype]

    test "redirects when data is valid", %{conn: conn, archetype: archetype} do
      conn = put(conn, Routes.archetype_path(conn, :update, archetype), archetype: @update_attrs)
      assert redirected_to(conn) == Routes.archetype_path(conn, :show, archetype)

      conn = get(conn, Routes.archetype_path(conn, :show, archetype))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, archetype: archetype} do
      conn = put(conn, Routes.archetype_path(conn, :update, archetype), archetype: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Archetype"
    end
  end

  describe "delete archetype" do
    setup [:create_archetype]

    test "deletes chosen archetype", %{conn: conn, archetype: archetype} do
      conn = delete(conn, Routes.archetype_path(conn, :delete, archetype))
      assert redirected_to(conn) == Routes.archetype_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.archetype_path(conn, :show, archetype))
      end
    end
  end

  defp create_archetype(_) do
    archetype = archetype_fixture()
    %{archetype: archetype}
  end
end
