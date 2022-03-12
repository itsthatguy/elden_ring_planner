defmodule EldenRingPlannerWeb.BuildController do
  use EldenRingPlannerWeb, :controller

  alias EldenRingPlanner.Builds
  alias EldenRingPlanner.Builds.Build

  def index(conn, _params) do
    build = Builds.list_build()
    render(conn, "index.html", build: build)
  end

  def new(conn, _params) do
    changeset = Builds.change_build(%Build{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"build" => build_params}) do
    case Builds.create_build(build_params) do
      {:ok, build} ->
        conn
        |> put_flash(:info, "Build created successfully.")
        |> redirect(to: Routes.build_path(conn, :show, build))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    build = Builds.get_build!(id)
    render(conn, "show.html", build: build)
  end

  def edit(conn, %{"id" => id}) do
    build = Builds.get_build!(id)
    changeset = Builds.change_build(build)
    render(conn, "edit.html", build: build, changeset: changeset)
  end

  def update(conn, %{"id" => id, "build" => build_params}) do
    build = Builds.get_build!(id)

    case Builds.update_build(build, build_params) do
      {:ok, build} ->
        conn
        |> put_flash(:info, "Build updated successfully.")
        |> redirect(to: Routes.build_path(conn, :show, build))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", build: build, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    build = Builds.get_build!(id)
    {:ok, _build} = Builds.delete_build(build)

    conn
    |> put_flash(:info, "Build deleted successfully.")
    |> redirect(to: Routes.build_path(conn, :index))
  end
end
