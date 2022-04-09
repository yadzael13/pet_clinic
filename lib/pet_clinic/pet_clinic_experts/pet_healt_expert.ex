defmodule PetClinic.PetClinicExperts.PetHealtExpert do
  use Ecto.Schema
  import Ecto.Changeset

  schema "petexperts" do
    field :age, :integer
    field :email, :string
    field :name, :string
    field :sex, :string
    field :specialities, :string

    timestamps()
  end

  @doc false
  def changeset(pet_healt_expert, attrs) do
    pet_healt_expert
    |> cast(attrs, [:name, :age, :email, :specialities, :sex])
    |> validate_required([:name, :age, :email, :specialities, :sex])
  end
end
