defmodule PetClinic.PetClinicExpertsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PetClinic.PetClinicExperts` context.
  """

  @doc """
  Generate a pet_healt_expert.
  """
  def pet_healt_expert_fixture(attrs \\ %{}) do
    {:ok, pet_healt_expert} =
      attrs
      |> Enum.into(%{
        age: 42,
        email: "some email",
        name: "some name",
        sex: "some sex",
        specialities: "some specialities"
      })
      |> PetClinic.PetClinicExperts.create_pet_healt_expert()

    pet_healt_expert
  end
end
