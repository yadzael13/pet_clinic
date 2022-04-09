defmodule PetClinic.PetClinicExpertsTest do
  use PetClinic.DataCase

  alias PetClinic.PetClinicExperts

  describe "petexperts" do
    alias PetClinic.PetClinicExperts.PetHealtExpert

    import PetClinic.PetClinicExpertsFixtures

    @invalid_attrs %{age: nil, email: nil, name: nil, sex: nil, specialities: nil}

    test "list_petexperts/0 returns all petexperts" do
      pet_healt_expert = pet_healt_expert_fixture()
      assert PetClinicExperts.list_petexperts() == [pet_healt_expert]
    end

    test "get_pet_healt_expert!/1 returns the pet_healt_expert with given id" do
      pet_healt_expert = pet_healt_expert_fixture()
      assert PetClinicExperts.get_pet_healt_expert!(pet_healt_expert.id) == pet_healt_expert
    end

    test "create_pet_healt_expert/1 with valid data creates a pet_healt_expert" do
      valid_attrs = %{age: 42, email: "some email", name: "some name", sex: "some sex", specialities: "some specialities"}

      assert {:ok, %PetHealtExpert{} = pet_healt_expert} = PetClinicExperts.create_pet_healt_expert(valid_attrs)
      assert pet_healt_expert.age == 42
      assert pet_healt_expert.email == "some email"
      assert pet_healt_expert.name == "some name"
      assert pet_healt_expert.sex == "some sex"
      assert pet_healt_expert.specialities == "some specialities"
    end

    test "create_pet_healt_expert/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PetClinicExperts.create_pet_healt_expert(@invalid_attrs)
    end

    test "update_pet_healt_expert/2 with valid data updates the pet_healt_expert" do
      pet_healt_expert = pet_healt_expert_fixture()
      update_attrs = %{age: 43, email: "some updated email", name: "some updated name", sex: "some updated sex", specialities: "some updated specialities"}

      assert {:ok, %PetHealtExpert{} = pet_healt_expert} = PetClinicExperts.update_pet_healt_expert(pet_healt_expert, update_attrs)
      assert pet_healt_expert.age == 43
      assert pet_healt_expert.email == "some updated email"
      assert pet_healt_expert.name == "some updated name"
      assert pet_healt_expert.sex == "some updated sex"
      assert pet_healt_expert.specialities == "some updated specialities"
    end

    test "update_pet_healt_expert/2 with invalid data returns error changeset" do
      pet_healt_expert = pet_healt_expert_fixture()
      assert {:error, %Ecto.Changeset{}} = PetClinicExperts.update_pet_healt_expert(pet_healt_expert, @invalid_attrs)
      assert pet_healt_expert == PetClinicExperts.get_pet_healt_expert!(pet_healt_expert.id)
    end

    test "delete_pet_healt_expert/1 deletes the pet_healt_expert" do
      pet_healt_expert = pet_healt_expert_fixture()
      assert {:ok, %PetHealtExpert{}} = PetClinicExperts.delete_pet_healt_expert(pet_healt_expert)
      assert_raise Ecto.NoResultsError, fn -> PetClinicExperts.get_pet_healt_expert!(pet_healt_expert.id) end
    end

    test "change_pet_healt_expert/1 returns a pet_healt_expert changeset" do
      pet_healt_expert = pet_healt_expert_fixture()
      assert %Ecto.Changeset{} = PetClinicExperts.change_pet_healt_expert(pet_healt_expert)
    end
  end
end
