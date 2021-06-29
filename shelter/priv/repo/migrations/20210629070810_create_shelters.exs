defmodule Shelter.Repo.Migrations.CreateShelters do
  use Ecto.Migration

  def change do
    create table(:shelters) do

    add :name, :string
    add :code, :string
    add :prefectures, :string
    add :locationname, :string
    add :address, :string
    add :lat, :string
    add :lng, :string
    end
  end
end
