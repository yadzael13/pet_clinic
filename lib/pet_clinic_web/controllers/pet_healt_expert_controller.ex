defmodule PetClinicWeb.PetHealtExpertController do
  use PetClinicWeb, :controller

  alias PetClinic.PetClinicExperts
  alias PetClinic.PetClinicExperts.PetHealtExpert

  def index(conn, _params) do
    petexperts = PetClinicExperts.list_petexperts()
    render(conn, "index.html", petexperts: petexperts)
  end

  def new(conn, _params) do
    changeset = PetClinicExperts.change_pet_healt_expert(%PetHealtExpert{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pet_healt_expert" => pet_healt_expert_params}) do
    case PetClinicExperts.create_pet_healt_expert(pet_healt_expert_params) do
      {:ok, pet_healt_expert} ->
        conn
        |> put_flash(:info, "Pet healt expert created successfully.")
        |> redirect(to: Routes.pet_healt_expert_path(conn, :show, pet_healt_expert))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pet_healt_expert = PetClinicExperts.get_pet_healt_expert!(id)
    render(conn, "show.html", pet_healt_expert: pet_healt_expert)
  end

  def edit(conn, %{"id" => id}) do
    pet_healt_expert = PetClinicExperts.get_pet_healt_expert!(id)
    changeset = PetClinicExperts.change_pet_healt_expert(pet_healt_expert)
    render(conn, "edit.html", pet_healt_expert: pet_healt_expert, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pet_healt_expert" => pet_healt_expert_params}) do
    pet_healt_expert = PetClinicExperts.get_pet_healt_expert!(id)

    case PetClinicExperts.update_pet_healt_expert(pet_healt_expert, pet_healt_expert_params) do
      {:ok, pet_healt_expert} ->
        conn
        |> put_flash(:info, "Pet healt expert updated successfully.")
        |> redirect(to: Routes.pet_healt_expert_path(conn, :show, pet_healt_expert))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pet_healt_expert: pet_healt_expert, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pet_healt_expert = PetClinicExperts.get_pet_healt_expert!(id)
    {:ok, _pet_healt_expert} = PetClinicExperts.delete_pet_healt_expert(pet_healt_expert)

    conn
    |> put_flash(:info, "Pet healt expert deleted successfully.")
    |> redirect(to: Routes.pet_healt_expert_path(conn, :index))
  end
end
