defmodule PetClinic.PetClinicExperts do
  @moduledoc """
  The PetClinicExperts context.
  """

  import Ecto.Query, warn: false
  alias PetClinic.Repo

  alias PetClinic.PetClinicExperts.PetHealtExpert

  @doc """
  Returns the list of petexperts.

  ## Examples

      iex> list_petexperts()
      [%PetHealtExpert{}, ...]

  """
  def list_petexperts do
    Repo.all(PetHealtExpert)
  end

  @doc """
  Gets a single pet_healt_expert.

  Raises `Ecto.NoResultsError` if the Pet healt expert does not exist.

  ## Examples

      iex> get_pet_healt_expert!(123)
      %PetHealtExpert{}

      iex> get_pet_healt_expert!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pet_healt_expert!(id), do: Repo.get!(PetHealtExpert, id)

  @doc """
  Creates a pet_healt_expert.

  ## Examples

      iex> create_pet_healt_expert(%{field: value})
      {:ok, %PetHealtExpert{}}

      iex> create_pet_healt_expert(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pet_healt_expert(attrs \\ %{}) do
    %PetHealtExpert{}
    |> PetHealtExpert.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pet_healt_expert.

  ## Examples

      iex> update_pet_healt_expert(pet_healt_expert, %{field: new_value})
      {:ok, %PetHealtExpert{}}

      iex> update_pet_healt_expert(pet_healt_expert, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pet_healt_expert(%PetHealtExpert{} = pet_healt_expert, attrs) do
    pet_healt_expert
    |> PetHealtExpert.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pet_healt_expert.

  ## Examples

      iex> delete_pet_healt_expert(pet_healt_expert)
      {:ok, %PetHealtExpert{}}

      iex> delete_pet_healt_expert(pet_healt_expert)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pet_healt_expert(%PetHealtExpert{} = pet_healt_expert) do
    Repo.delete(pet_healt_expert)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pet_healt_expert changes.

  ## Examples

      iex> change_pet_healt_expert(pet_healt_expert)
      %Ecto.Changeset{data: %PetHealtExpert{}}

  """
  def change_pet_healt_expert(%PetHealtExpert{} = pet_healt_expert, attrs \\ %{}) do
    PetHealtExpert.changeset(pet_healt_expert, attrs)
  end
end
