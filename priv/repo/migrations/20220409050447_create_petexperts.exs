defmodule PetClinic.Repo.Migrations.CreatePetexperts do
  use Ecto.Migration

  def change do
    create table(:petexperts) do
      add :name, :string
      add :age, :integer
      add :email, :string
      add :specialities, :string
      add :sex, :string

      timestamps()
    end
  end
end
