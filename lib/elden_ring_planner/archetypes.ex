defmodule EldenRingPlanner.Archetypes do
  @moduledoc """
  The Archetypes context.
  """

  import Ecto.Query, warn: false
  alias EldenRingPlanner.Repo

  alias EldenRingPlanner.Archetypes.Archetype

  @doc """
  Returns the list of archetype.

  ## Examples

      iex> list_archetype()
      [%Archetype{}, ...]

  """
  def list_archetype do
    Repo.all(Archetype)
  end

  @doc """
  Gets a single archetype.

  Raises `Ecto.NoResultsError` if the Archetype does not exist.

  ## Examples

      iex> get_archetype!(123)
      %Archetype{}

      iex> get_archetype!(456)
      ** (Ecto.NoResultsError)

  """
  def get_archetype!(id), do: Repo.get!(Archetype, id)

  @doc """
  Creates a archetype.

  ## Examples

      iex> create_archetype(%{field: value})
      {:ok, %Archetype{}}

      iex> create_archetype(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_archetype(attrs \\ %{}) do
    %Archetype{}
    |> Archetype.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a archetype.

  ## Examples

      iex> update_archetype(archetype, %{field: new_value})
      {:ok, %Archetype{}}

      iex> update_archetype(archetype, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_archetype(%Archetype{} = archetype, attrs) do
    archetype
    |> Archetype.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a archetype.

  ## Examples

      iex> delete_archetype(archetype)
      {:ok, %Archetype{}}

      iex> delete_archetype(archetype)
      {:error, %Ecto.Changeset{}}

  """
  def delete_archetype(%Archetype{} = archetype) do
    Repo.delete(archetype)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking archetype changes.

  ## Examples

      iex> change_archetype(archetype)
      %Ecto.Changeset{data: %Archetype{}}

  """
  def change_archetype(%Archetype{} = archetype, attrs \\ %{}) do
    Archetype.changeset(archetype, attrs)
  end
end
