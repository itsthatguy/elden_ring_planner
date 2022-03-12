defmodule EldenRingPlannerWeb.ArchetypeController do
  use EldenRingPlannerWeb, :controller

  alias EldenRingPlanner.Archetypes
  alias EldenRingPlanner.Archetypes.Archetype

  def index(conn, _params) do
    archetype = Archetypes.list_archetype()
    render(conn, "index.html", archetype: archetype)
  end

  def new(conn, _params) do
    changeset = Archetypes.change_archetype(%Archetype{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"archetype" => archetype_params}) do
    case Archetypes.create_archetype(archetype_params) do
      {:ok, archetype} ->
        conn
        |> put_flash(:info, "Archetype created successfully.")
        |> redirect(to: Routes.archetype_path(conn, :show, archetype))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    archetype = Archetypes.get_archetype!(id)
    render(conn, "show.html", archetype: archetype)
  end

  def edit(conn, %{"id" => id}) do
    archetype = Archetypes.get_archetype!(id)
    changeset = Archetypes.change_archetype(archetype)
    render(conn, "edit.html", archetype: archetype, changeset: changeset)
  end

  def update(conn, %{"id" => id, "archetype" => archetype_params}) do
    archetype = Archetypes.get_archetype!(id)

    case Archetypes.update_archetype(archetype, archetype_params) do
      {:ok, archetype} ->
        conn
        |> put_flash(:info, "Archetype updated successfully.")
        |> redirect(to: Routes.archetype_path(conn, :show, archetype))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", archetype: archetype, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    archetype = Archetypes.get_archetype!(id)
    {:ok, _archetype} = Archetypes.delete_archetype(archetype)

    conn
    |> put_flash(:info, "Archetype deleted successfully.")
    |> redirect(to: Routes.archetype_path(conn, :index))
  end
end
